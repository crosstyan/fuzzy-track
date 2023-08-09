import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fuzzy_track/fuzzy_track.dart';

part 'track_init_fis.freezed.dart';
part 'track_init_fis.g.dart';

@freezed
class TrackInitFIS with _$TrackInitFIS {
  @JsonSerializable(fieldRename: FieldRename.pascal, explicitToJson: true)
  const factory TrackInitFIS({
    @Default(1) double speed,
    @Default(0.1) double lengthMeter,
    @Default(60) double baseHR,
    @Default(1.5) double targetHRMul,
    @Default(1) double lowHRMul,
    @Default(2) double highHRMul,
    @Default(10) double sigmaHR,
    @Default(30) double shortFoot,
    @Default(30) double longShoulder,
    @Default(0) double longFoot,
    @Default(10) double sigmaResult,
  }) = _TrackInitFIS;

  factory TrackInitFIS.fromJson(Map<String, dynamic> json) =>
      _$TrackInitFISFromJson(json);
}

class TrackFIS extends FIS {
  /// Speed in m/s
  final double speed;
  get speedKmh => speed * 3.6;

  TrackFIS({
    this.speed = 1,
    baseHR = 60,
    targetHRMul = 1.5,
    lowHRMul = 1,
    highHRMul = 2,
    sigmaHR = 10,
    shortFoot = 30,
    longShoulder = 90,
    longFoot = 0,
    sigmaResult = 10,
  }) : super(
            baseHR: baseHR,
            targetHRMul: targetHRMul,
            lowHRMul: lowHRMul,
            highHRMul: highHRMul,
            sigmaHR: sigmaHR,
            shortFoot: shortFoot,
            longShoulder: longShoulder,
            sigmaResult: sigmaResult,
            longFoot: longFoot);

  factory TrackFIS.fromInit(TrackInitFIS data) {
    return TrackFIS(
        baseHR: data.baseHR,
        targetHRMul: data.targetHRMul,
        lowHRMul: data.lowHRMul,
        highHRMul: data.highHRMul,
        sigmaHR: data.sigmaHR,
        shortFoot: data.shortFoot,
        longShoulder: data.longShoulder,
        sigmaResult: data.sigmaResult,
        longFoot: data.longFoot,
        speed: data.speed);
  }

  TrackInitFIS getInit() {
    return TrackInitFIS(
      baseHR: baseHR,
      targetHRMul: targetHRMul,
      lowHRMul: lowHRMul,
      highHRMul: highHRMul,
      sigmaHR: sigmaHR,
      shortFoot: shortFoot,
      longShoulder: longShoulder,
      sigmaResult: sigmaResult,
      longFoot: longFoot,
      speed: speed,
    );
  }
}
