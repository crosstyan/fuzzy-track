part of './track_group.dart';

class SpeedHrStateController {
  List<SpeedHrFIS> _groupCache = [];
  List<SpeedHrFISParams> _groupInitCache = [];

  SpeedHrState step(
      {required double hr,
      required DateTime time,
      required SpeedHrState state}) {
    // here is the only not pure part of the function
    // I can of course construct FIS every time but I want to avoid it
    if (!listEquals(state.group, _groupInitCache)) {
      _groupInitCache = state.group;
      _groupCache = _groupInitCache.map((e) => SpeedHrFIS.fromInit(e)).toList();
    }
    // every thing is pure now
    final diff = time.difference(state.lastTickTime);
    if (diff.inSeconds > 1) {
      final tempTime = state.time + diff.inSeconds;
      final tempIdx = _validIdx(state.index);
      final current = _groupCache[tempIdx];
      final possibility = (current.eval(hr, tempTime) ?? 0) / 100;
      final res = SpeedHrController.decision(possibility.toDouble());
      final direction = possibility > 0;
      final List<bool> windowClone = List.from(state.resultWindow);
      final tempWindow =
          SpeedHrController.addDequeue(windowClone, state.stability, res);
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
        resIndex = tempIdx;
        resTime = tempTime;
        resWindow = tempWindow;
      }
      return SpeedHrState(
          group: _groupInitCache,
          time: resTime,
          stability: state.stability,
          possibility: possibility.toDouble(),
          speed: current.speed,
          hr: hr,
          resultWindow: resWindow,
          lastTickTime: resLastTickTime,
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
