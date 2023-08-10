import 'dart:math';

import 'package:fuzzylogic/fuzzylogic.dart';

/// https://ww2.mathworks.cn/help/fuzzy/gaussmf.html
class GaussianMF<T extends num> extends MembershipFunction<T> {
  GaussianMF({this.mean = 0, this.stdDev = 1}) {
    representativeValue = mean;
  }

  final double mean;
  final double stdDev;
  late final double representativeValue;

  @override
  num getDegreeOfMembership(num o) {
    var sigma = stdDev;
    final val = pow(
      e,
      -(pow(o - mean, 2.0) / (2 * pow(sigma, 2.0))),
    );
    return val;
  }
}

/// https://ww2.mathworks.cn/help/fuzzy/smf.html
/// Right Shoulder
class SMF<T extends num> extends MembershipFunction<T> {
  SMF({this.foot = 1, this.shoulder = 8}) {
    if (foot > shoulder) {
      throw ArgumentError('foot should be less than shoulder, just like S');
    }
    representativeValue = (foot + shoulder) / 2;
  }

  final double foot;
  final double shoulder;
  late final double representativeValue;

  num value(num x) {
    var mid = (foot + shoulder) / 2;
    if (x <= foot) {
      return 0;
    } else if (x >= shoulder) {
      return 1;
    } else if (foot <= x && x <= mid) {
      var n = (x - foot) / (shoulder - foot);
      return 2 * pow(n, 2);
    } else {
      var n = (x - shoulder) / (shoulder - foot);
      return 1 - 2 * pow(n, 2);
    }
  }

  @override
  num getDegreeOfMembership(num o) {
    return value(o);
  }
}

/// https://ww2.mathworks.cn/help/fuzzy/zmf.html
/// Left Shoulder
class ZMF<T extends num> extends MembershipFunction<T> {
  ZMF({this.foot = 7, this.shoulder = 3}) {
    if (foot < shoulder) {
      throw ArgumentError('foot must be bigger than shoulder, just like Z');
    }
  }

  final double foot;
  final double shoulder;

  num value(num x) {
    final a = shoulder;
    final b = foot;
    final mid = (foot + shoulder) / 2;
    if (x <= a) {
      return 1;
    } else if (x >= b) {
      return 0;
    } else if (a <= x && x <= mid) {
      var n = (x - a) / (b - a);
      return 1 - 2 * pow(n, 2);
    } else {
      var n = (x - b) / (b - a);
      return 2 * pow(n, 2);
    }
  }

  @override
  num getDegreeOfMembership(num o) {
    return value(o);
  }
}

class FuzzyHR extends FuzzyVariable<num> {
  final double baseHR;
  final double targetMul;
  final double lowMul;
  final double highMul;
  final double sigma;
  late final targetHR = baseHR * targetMul;
  late final lowHR = baseHR * lowMul;
  late final highHR = baseHR * highMul;

  late final low = FuzzySet(ZMF(foot: targetHR, shoulder: lowHR), lowHR);
  late final gaussian = GaussianMF(mean: targetHR, stdDev: sigma);
  late final target = FuzzySet(gaussian, gaussian.representativeValue);
  late final high = FuzzySet(SMF(foot: targetHR, shoulder: highHR), highHR);

  // late var low = FuzzySet.LeftShoulder(0, lowHR, targetHR);
  // late var target = FuzzySet.Triangle(targetHR - 10, targetHR, targetHR + 10);
  // late var high = FuzzySet.RightShoulder(targetHR, highHR, 150);
  FuzzyHR(
      {this.baseHR = 70,
      this.targetMul = 1.5,
      this.lowMul = 1,
      this.highMul = 2,
      this.sigma = 10}) {
    sets = [low, target, high];
    init();
  }
}

class FuzzyTime extends FuzzyVariable<num> {
  final double shortFoot;
  final double longShoulder;
  final double longFoot;
  late final short = FuzzySet(ZMF(foot: shortFoot, shoulder: 0), 0);
  late final long = FuzzySet(SMF(foot: longFoot, shoulder: longShoulder), 90);

  // late var short = FuzzySet.LeftShoulder(0, 5, 30);
  // late var long = FuzzySet.RightShoulder(30, 60, 100);
  FuzzyTime({this.longShoulder = 120, this.shortFoot = 30, this.longFoot = 0}) {
    sets = [short, long];
    init();
  }
}

class FuzzyResult extends FuzzyVariable<num> {
  final double sigma;
  late final up = FuzzySet(SMF(foot: 0, shoulder: 100), 100);
  late final down = FuzzySet(ZMF(foot: 0, shoulder: -100), -100);
  late final nc = FuzzySet(GaussianMF(mean: 0, stdDev: sigma), 0);

  // late var up = FuzzySet.RightShoulder(0, 50, 100);
  // late var down = FuzzySet.LeftShoulder(-100, -50, 0);
  // late var nc = FuzzySet.Triangle(-20, 0, 20);
  FuzzyResult({this.sigma = 10}) {
    sets = [up, down, nc];
    init();
  }
}

class SpeedHrBaseFIS {
  final double baseHR;
  final double targetHRMul;
  final double lowHRMul;
  final double highHRMul;
  final double sigmaHR;
  final double shortFoot;
  final double longShoulder;
  final double sigmaResult;
  final double longFoot;
  final rules = FuzzyRuleBase();
  late final hr = FuzzyHR(
      baseHR: baseHR,
      targetMul: targetHRMul,
      lowMul: lowHRMul,
      highMul: highHRMul,
      sigma: sigmaHR);
  late final time = FuzzyTime(
      longShoulder: longShoulder, shortFoot: shortFoot, longFoot: longFoot);
  late final result = FuzzyResult(sigma: sigmaResult);

  SpeedHrBaseFIS(
      {this.baseHR = 70,
      this.targetHRMul = 1.5,
      this.lowHRMul = 1,
      this.highHRMul = 2,
      this.sigmaHR = 10,
      this.shortFoot = 30,
      this.longShoulder = 120,
      this.sigmaResult = 10,
      this.longFoot = 0}) {
    rules.addRules([
      (hr.target & time.long) >> (result.nc),
      (hr.low & time.long) >> (result.up),
      (hr.high & time.long) >> (result.down),
      (hr.target) >> (result.nc),
      (time.short) >> (result.nc),
    ]);
  }

  num? eval(num hr, num time) {
    final output = result.createOutputPlaceholder();
    rules.resolve(
        inputs: [this.hr.assign(hr), this.time.assign(time)],
        outputs: [output]);
    return output.crispValue;
  }
}
