import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:fuzzy_track/fuzzy_track.dart';

part 'track_group.pure.dart';

enum TrackMove {
  up,
  down,
  notChanged,
}

class TrackGroup {
  final double baseHR;
  double _time = 0;
  int _index = 0;
  int windowSize = 5;
  double _lastPossibility = 0;
  DateTime initTickTime;
  DateTime _lastTickTime;
  late TrackFIS _current = _group[_index];
  late final List<TrackFIS> _group;
  late final List<TrackInitFIS> _groupInit;
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

  static List<TrackInitFIS> getDefaultGroup(double baseHR) {
    return [
      TrackInitFIS(speed: 0.5, baseHR: baseHR, shortFoot: 30),
      TrackInitFIS(speed: 1, baseHR: baseHR, shortFoot: 10),
      TrackInitFIS(speed: 1.25, baseHR: baseHR, shortFoot: 10),
      TrackInitFIS(speed: 1.5, baseHR: baseHR, shortFoot: 5, sigmaHR: 8),
      TrackInitFIS(speed: 1.75, baseHR: baseHR, shortFoot: 5, sigmaHR: 5),
      TrackInitFIS(speed: 2, baseHR: baseHR, shortFoot: 10, sigmaHR: 3),
      TrackInitFIS(speed: 2.5, baseHR: baseHR, shortFoot: 5, sigmaHR: 3),
      TrackInitFIS(speed: 3, baseHR: baseHR, shortFoot: 3, sigmaHR: 2),
    ];
  }

  TrackGroup(
      {this.baseHR = 60, required this.initTickTime, this.windowSize = 5})
      : _groupInit = TrackGroup.getDefaultGroup(baseHR),
        _group = TrackGroup.getDefaultGroup(baseHR)
            .map((data) => TrackFIS.fromInit(data))
            .toList(),
        _lastTickTime = initTickTime;

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
    _resultWindow = TrackGroup.addDequeue(_resultWindow, windowSize, elem);
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
  TrackData step(double hr, DateTime time) {
    final diff = time.difference(_lastTickTime);
    if (diff.inSeconds >= 1) {
      _lastTickTime = time;
      // _tick();
      _time = _time + diff.inSeconds;
    }
    _getMove(hr);
    return TrackData(
        group: _groupInit,
        time: _time.toInt(),
        windowSize: windowSize,
        possibility: _lastPossibility,
        speed: _current.speed,
        resultWindow: _resultWindow,
        lastTickTime: _lastTickTime,
        index: index);
  }

  void reset() {
    resetWith(initTickTime);
  }

  void resetWith(DateTime initTime) {
    _time = 0;
    _index = 0;
    initTickTime = initTime;
    _lastTickTime = initTime;
    _current = _group[_index];
  }
}
