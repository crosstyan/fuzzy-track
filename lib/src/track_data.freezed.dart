// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'track_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TrackData _$TrackDataFromJson(Map<String, dynamic> json) {
  return _TrackData.fromJson(json);
}

/// @nodoc
mixin _$TrackData {
  List<TrackInitFIS> get group => throw _privateConstructorUsedError;
  int get time => throw _privateConstructorUsedError;
  int get windowSize => throw _privateConstructorUsedError;
  double get possibility => throw _privateConstructorUsedError;
  Duration get delay => throw _privateConstructorUsedError;
  List<bool> get resultWindow => throw _privateConstructorUsedError;
  DateTime get lastTickTime => throw _privateConstructorUsedError;
  DateTime get initTickTime => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrackDataCopyWith<TrackData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackDataCopyWith<$Res> {
  factory $TrackDataCopyWith(TrackData value, $Res Function(TrackData) then) =
      _$TrackDataCopyWithImpl<$Res>;
  $Res call(
      {List<TrackInitFIS> group,
      int time,
      int windowSize,
      double possibility,
      Duration delay,
      List<bool> resultWindow,
      DateTime lastTickTime,
      DateTime initTickTime,
      int index});
}

/// @nodoc
class _$TrackDataCopyWithImpl<$Res> implements $TrackDataCopyWith<$Res> {
  _$TrackDataCopyWithImpl(this._value, this._then);

  final TrackData _value;
  // ignore: unused_field
  final $Res Function(TrackData) _then;

  @override
  $Res call({
    Object? group = freezed,
    Object? time = freezed,
    Object? windowSize = freezed,
    Object? possibility = freezed,
    Object? delay = freezed,
    Object? resultWindow = freezed,
    Object? lastTickTime = freezed,
    Object? initTickTime = freezed,
    Object? index = freezed,
  }) {
    return _then(_value.copyWith(
      group: group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as List<TrackInitFIS>,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      windowSize: windowSize == freezed
          ? _value.windowSize
          : windowSize // ignore: cast_nullable_to_non_nullable
              as int,
      possibility: possibility == freezed
          ? _value.possibility
          : possibility // ignore: cast_nullable_to_non_nullable
              as double,
      delay: delay == freezed
          ? _value.delay
          : delay // ignore: cast_nullable_to_non_nullable
              as Duration,
      resultWindow: resultWindow == freezed
          ? _value.resultWindow
          : resultWindow // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      lastTickTime: lastTickTime == freezed
          ? _value.lastTickTime
          : lastTickTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      initTickTime: initTickTime == freezed
          ? _value.initTickTime
          : initTickTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_TrackDataCopyWith<$Res> implements $TrackDataCopyWith<$Res> {
  factory _$$_TrackDataCopyWith(
          _$_TrackData value, $Res Function(_$_TrackData) then) =
      __$$_TrackDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<TrackInitFIS> group,
      int time,
      int windowSize,
      double possibility,
      Duration delay,
      List<bool> resultWindow,
      DateTime lastTickTime,
      DateTime initTickTime,
      int index});
}

/// @nodoc
class __$$_TrackDataCopyWithImpl<$Res> extends _$TrackDataCopyWithImpl<$Res>
    implements _$$_TrackDataCopyWith<$Res> {
  __$$_TrackDataCopyWithImpl(
      _$_TrackData _value, $Res Function(_$_TrackData) _then)
      : super(_value, (v) => _then(v as _$_TrackData));

  @override
  _$_TrackData get _value => super._value as _$_TrackData;

  @override
  $Res call({
    Object? group = freezed,
    Object? time = freezed,
    Object? windowSize = freezed,
    Object? possibility = freezed,
    Object? delay = freezed,
    Object? resultWindow = freezed,
    Object? lastTickTime = freezed,
    Object? initTickTime = freezed,
    Object? index = freezed,
  }) {
    return _then(_$_TrackData(
      group: group == freezed
          ? _value._group
          : group // ignore: cast_nullable_to_non_nullable
              as List<TrackInitFIS>,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      windowSize: windowSize == freezed
          ? _value.windowSize
          : windowSize // ignore: cast_nullable_to_non_nullable
              as int,
      possibility: possibility == freezed
          ? _value.possibility
          : possibility // ignore: cast_nullable_to_non_nullable
              as double,
      delay: delay == freezed
          ? _value.delay
          : delay // ignore: cast_nullable_to_non_nullable
              as Duration,
      resultWindow: resultWindow == freezed
          ? _value._resultWindow
          : resultWindow // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      lastTickTime: lastTickTime == freezed
          ? _value.lastTickTime
          : lastTickTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      initTickTime: initTickTime == freezed
          ? _value.initTickTime
          : initTickTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal, explicitToJson: true)
class _$_TrackData with DiagnosticableTreeMixin implements _TrackData {
  const _$_TrackData(
      {required final List<TrackInitFIS> group,
      required this.time,
      required this.windowSize,
      this.possibility = 0,
      this.delay = const Duration(milliseconds: 100),
      required final List<bool> resultWindow,
      required this.lastTickTime,
      required this.initTickTime,
      required this.index})
      : assert(time >= 0),
        assert(windowSize > 0),
        assert(index >= 0),
        _group = group,
        _resultWindow = resultWindow;

  factory _$_TrackData.fromJson(Map<String, dynamic> json) =>
      _$$_TrackDataFromJson(json);

  final List<TrackInitFIS> _group;
  @override
  List<TrackInitFIS> get group {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_group);
  }

  @override
  final int time;
  @override
  final int windowSize;
  @override
  @JsonKey()
  final double possibility;
  @override
  @JsonKey()
  final Duration delay;
  final List<bool> _resultWindow;
  @override
  List<bool> get resultWindow {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_resultWindow);
  }

  @override
  final DateTime lastTickTime;
  @override
  final DateTime initTickTime;
  @override
  final int index;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrackData(group: $group, time: $time, windowSize: $windowSize, possibility: $possibility, delay: $delay, resultWindow: $resultWindow, lastTickTime: $lastTickTime, initTickTime: $initTickTime, index: $index)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TrackData'))
      ..add(DiagnosticsProperty('group', group))
      ..add(DiagnosticsProperty('time', time))
      ..add(DiagnosticsProperty('windowSize', windowSize))
      ..add(DiagnosticsProperty('possibility', possibility))
      ..add(DiagnosticsProperty('delay', delay))
      ..add(DiagnosticsProperty('resultWindow', resultWindow))
      ..add(DiagnosticsProperty('lastTickTime', lastTickTime))
      ..add(DiagnosticsProperty('initTickTime', initTickTime))
      ..add(DiagnosticsProperty('index', index));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TrackData &&
            const DeepCollectionEquality().equals(other._group, _group) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality()
                .equals(other.windowSize, windowSize) &&
            const DeepCollectionEquality()
                .equals(other.possibility, possibility) &&
            const DeepCollectionEquality().equals(other.delay, delay) &&
            const DeepCollectionEquality()
                .equals(other._resultWindow, _resultWindow) &&
            const DeepCollectionEquality()
                .equals(other.lastTickTime, lastTickTime) &&
            const DeepCollectionEquality()
                .equals(other.initTickTime, initTickTime) &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_group),
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(windowSize),
      const DeepCollectionEquality().hash(possibility),
      const DeepCollectionEquality().hash(delay),
      const DeepCollectionEquality().hash(_resultWindow),
      const DeepCollectionEquality().hash(lastTickTime),
      const DeepCollectionEquality().hash(initTickTime),
      const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  _$$_TrackDataCopyWith<_$_TrackData> get copyWith =>
      __$$_TrackDataCopyWithImpl<_$_TrackData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TrackDataToJson(
      this,
    );
  }
}

abstract class _TrackData implements TrackData {
  const factory _TrackData(
      {required final List<TrackInitFIS> group,
      required final int time,
      required final int windowSize,
      final double possibility,
      final Duration delay,
      required final List<bool> resultWindow,
      required final DateTime lastTickTime,
      required final DateTime initTickTime,
      required final int index}) = _$_TrackData;

  factory _TrackData.fromJson(Map<String, dynamic> json) =
      _$_TrackData.fromJson;

  @override
  List<TrackInitFIS> get group;
  @override
  int get time;
  @override
  int get windowSize;
  @override
  double get possibility;
  @override
  Duration get delay;
  @override
  List<bool> get resultWindow;
  @override
  DateTime get lastTickTime;
  @override
  DateTime get initTickTime;
  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$_TrackDataCopyWith<_$_TrackData> get copyWith =>
      throw _privateConstructorUsedError;
}
