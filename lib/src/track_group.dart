import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:fuzzy_track/fuzzy_track.dart';

part 'track_group.pure.dart';

enum TrackMove {
  up,
  down,
  notChanged,
}

class SpeedHrController {
  double _time = 0;
  int _index = 0;

  /// i.e. the window size of the result window
  /// 0 < stability <= positive integer (However I don't recommend to set it greater than 5)
  /// You would need roll consecutive [stability] times True to push it to next level.
  ///
  /// TODO: better algorithm to determine the stability. something like 5 out of 7 times?
  int stability = 5;
  double _lastPossibility = 0;
  late DateTime initTickTime;
  late DateTime _lastTickTime;
  late SpeedHrFIS _current = _group[_index];
  late final List<SpeedHrFIS> _group;
  late final List<SpeedHrFISParams> _groupInit;
  List<bool> _resultWindow = [];

  get index {
    return _index;
  }

  get time {
    return _time;
  }

  get group {
    return _group;
  }

  get maxIndex {
    return _group.length - 1;
  }

  static List<SpeedHrFISParams> getDefaultGroup(
      double baseHR, double targetHRMul) {
    return [
      SpeedHrFISParams(
          speed: 0.5, baseHR: baseHR, shortFoot: 30, targetHRMul: targetHRMul),
      SpeedHrFISParams(
          speed: 1, baseHR: baseHR, shortFoot: 10, targetHRMul: targetHRMul),
      SpeedHrFISParams(
          speed: 1.25, baseHR: baseHR, shortFoot: 10, targetHRMul: targetHRMul),
      SpeedHrFISParams(
          speed: 1.5,
          baseHR: baseHR,
          shortFoot: 5,
          sigmaHR: 8,
          targetHRMul: targetHRMul),
      SpeedHrFISParams(
          speed: 1.75,
          baseHR: baseHR,
          shortFoot: 5,
          sigmaHR: 5,
          targetHRMul: targetHRMul),
      SpeedHrFISParams(
          speed: 2,
          baseHR: baseHR,
          shortFoot: 10,
          sigmaHR: 3,
          targetHRMul: targetHRMul),
      SpeedHrFISParams(
          speed: 2.5,
          baseHR: baseHR,
          shortFoot: 5,
          sigmaHR: 3,
          targetHRMul: targetHRMul),
      SpeedHrFISParams(
          speed: 3,
          baseHR: baseHR,
          shortFoot: 3,
          sigmaHR: 2,
          targetHRMul: targetHRMul),
    ];
  }

  /// baseHR and targetHRMul are used to construct the default group.
  /// You could provide your custom group by using [SpeedHrController.fromParamsGroup]
  SpeedHrController(
      {baseHR = 60,
      targetHRMul = 1.5,
      DateTime? initTickTime,
      this.stability = 5})
      : _groupInit = SpeedHrController.getDefaultGroup(baseHR, targetHRMul),
        _group = SpeedHrController.getDefaultGroup(baseHR, targetHRMul)
            .map((data) => SpeedHrFIS.fromInit(data))
            .toList() {
    if (initTickTime == null) {
      this.initTickTime = DateTime.now();
    } else {
      this.initTickTime = initTickTime;
    }
    _lastTickTime = this.initTickTime;
  }

  factory SpeedHrController.fromParamsGroup(List<SpeedHrFISParams> group,
      {DateTime? initTickTime}) {
    initTickTime ??= DateTime.now();
    return SpeedHrController(
      initTickTime: initTickTime,
    )
      .._group = group.map((data) => SpeedHrFIS.fromInit(data)).toList()
      .._groupInit = group;
  }

  void up() {
    _index = _index + 1;
    if (_index >= _group.length) {
      _index = _group.length - 1;
    }
    _time = 0;
    _current = _group[_index];
    _resultWindow = [];
  }

  void down() {
    _index = _index - 1;
    if (_index < 0) {
      _index = 0;
    }
    _time = 0;
    _current = _group[_index];
    _resultWindow = [];
  }

  num? eval(hr) {
    return evalWith(hr, _time);
  }

  num? evalWith(hr, time) {
    final possibility = (_current.eval(hr, time) ?? 0) / 100;
    return possibility;
  }

  static bool decision(double possibility) {
    final rnd = Random().nextDouble(); // return 0 to 1
    return rnd < possibility.abs();
  }

  static List<T> addDequeue<T>(List<T> queue, int maxSize, T value) {
    queue.add(value);
    if (queue.length > maxSize) {
      var diff = queue.length - maxSize;
      var q = queue.skip(diff).toList();
      return q;
    }
    return queue;
  }

  /// @side effect
  List<bool> _addToWindow(bool elem) {
    _resultWindow =
        SpeedHrController.addDequeue(_resultWindow, stability, elem);
    return _resultWindow;
  }

  TrackMove _getMoveWith(double hr, double time) {
    final possibility = evalWith(hr, time);
    _lastPossibility = possibility?.toDouble() ?? 0;
    final res = decision(possibility!.toDouble());
    final direction = possibility > 0;
    _addToWindow(res);
    final bool ans = _resultWindow.reduce((value, element) => value & element);
    if (ans & direction) {
      up();
      return TrackMove.up;
    } else if (ans & !direction) {
      down();
      return TrackMove.down;
    } else {
      // do nothing
      return TrackMove.notChanged;
    }
  }

  TrackMove _getMove(double hr) {
    return _getMoveWith(hr, _time);
  }

  /// @side effect
  SpeedHrState step(double hr, DateTime time) {
    final diff = time.difference(_lastTickTime);
    if (diff.inSeconds >= 1) {
      _lastTickTime = time;
      // _tick();
      _time = _time + diff.inSeconds;
    }
    _getMove(hr);
    return SpeedHrState(
        group: _groupInit,
        time: _time.toInt(),
        possibility: _lastPossibility,
        speed: _current.speed,
        resultWindow: _resultWindow,
        lastTickTime: _lastTickTime,
        index: index);
  }

  void reset(DateTime? initTickTime) {
    initTickTime ??= DateTime.now();
    _time = 0;
    _index = 0;
    this.initTickTime = initTickTime;
    this._lastTickTime = initTickTime;
    _current = _group[_index];
  }

  void resetWith() {}
}
