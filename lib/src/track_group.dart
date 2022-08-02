import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:fuzzy_track/fuzzy_track.dart';
import './track_init_fis.dart';
import './track_data.dart';
import 'package:tuple/tuple.dart';
import 'package:collection/collection.dart';

enum TrackMove {
  up,
  down,
  notChanged,
}

class TrackGroupPure {
  List<TrackFIS> _groupCache = [];
  List<TrackInitFIS> _groupInitCache = [];

  TrackData step(
      {required double hr, required DateTime time, required TrackData state}) {
    // here is the only not pure part of the function
    // I can of course construct FIS every time but I want to avoid it
    if (!listEquals(state.group, _groupInitCache)) {
      _groupInitCache = state.group;
      _groupCache = _groupInitCache.map((e) => TrackFIS.fromInit(e)).toList();
    }
    // every thing is pure now
    final diff = time.difference(state.lastTickTime);
    if (diff.inSeconds > 1) {
      final tempTime = state.time + diff.inSeconds;
      final tempIdx = _validIdx(state.index);
      final current = _groupCache[tempIdx];
      final possibility = current.eval(hr, tempTime);
      final res = TrackGroup.decision(possibility!.toDouble());
      final direction = possibility > 0;
      final tempWindow =
          TrackGroup.addDequeue(state.resultWindow, state.windowSize, res);
      final bool ans = tempWindow.reduce((value, element) => value & element);
      late final int resIndex;
      late final int resTime;
      late final List<bool> resWindow;
      final DateTime resLastTickTime = state.lastTickTime.add(diff);
      // TODO: use a function
      if (ans & direction) {
        resIndex = _upIdx(state.index);
        resTime = 0;
        resWindow = [];
      } else if (ans & !direction) {
        resIndex = _downIdx(state.index);
        resTime = 0;
        resWindow = [];
      } else {
        resIndex = state.index;
        resTime = tempTime;
        resWindow = tempWindow;
      }
      return TrackData(
          group: _groupInitCache,
          time: resTime,
          windowSize: state.windowSize,
          possibility: possibility.toDouble(),
          delay: current.delay,
          resultWindow: resWindow,
          lastTickTime: resLastTickTime,
          initTickTime: state.initTickTime,
          index: resIndex);
    } else {
      return state;
    }
  }

  int _validIdx(int index) {
    if (index > _groupCache.length - 1) return _groupCache.length - 1;
    if (index < 0) return 0;
    return index;
  }

  int _upIdx(int index) {
    final tempIdx = index + 1;
    if (tempIdx >= _groupCache.length) {
      return _groupCache.length - 1;
    } else {
      return tempIdx;
    }
  }

  int _downIdx(int index) {
    final tempIdx = index - 1;
    if (tempIdx < 0) {
      return 0;
    } else {
      return tempIdx;
    }
  }
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

  static List<TrackInitFIS> getNewGroup(double baseHR) {
    final group = [
      TrackInitFIS(
          delay: const Duration(milliseconds: 80),
          baseHR: baseHR,
          shortFoot: 30),
      TrackInitFIS(
          delay: const Duration(milliseconds: 60),
          baseHR: baseHR,
          shortFoot: 10),
      TrackInitFIS(
          delay: const Duration(milliseconds: 50),
          baseHR: baseHR,
          shortFoot: 10),
      TrackInitFIS(
          delay: const Duration(milliseconds: 40),
          baseHR: baseHR,
          shortFoot: 5,
          sigmaHR: 8),
      TrackInitFIS(
          delay: const Duration(milliseconds: 35),
          baseHR: baseHR,
          shortFoot: 5,
          sigmaHR: 5),
      TrackInitFIS(
          delay: const Duration(milliseconds: 30),
          baseHR: baseHR,
          shortFoot: 10,
          sigmaHR: 3),
      TrackInitFIS(
          delay: const Duration(milliseconds: 27),
          baseHR: baseHR,
          shortFoot: 5,
          sigmaHR: 3),
      TrackInitFIS(
          delay: const Duration(milliseconds: 25),
          baseHR: baseHR,
          shortFoot: 3,
          sigmaHR: 2),
    ];
    return group;
  }

  TrackGroup(
      {this.baseHR = 60, required this.initTickTime, this.windowSize = 5})
      : _groupInit = TrackGroup.getNewGroup(baseHR),
        _group = TrackGroup.getNewGroup(baseHR)
            .map((data) => TrackFIS.fromInit(data))
            .toList(),
        _lastTickTime = initTickTime;

  double _tick() {
    _time = _time + 1;
    return _time;
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
        delay: _current.delay,
        resultWindow: _resultWindow,
        lastTickTime: _lastTickTime,
        initTickTime: initTickTime,
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
