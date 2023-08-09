// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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

  /// speed in m/s
  double get speed => throw _privateConstructorUsedError;
  double get hr => throw _privateConstructorUsedError;
  List<bool> get resultWindow => throw _privateConstructorUsedError;
  DateTime get lastTickTime => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrackDataCopyWith<TrackData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackDataCopyWith<$Res> {
  factory $TrackDataCopyWith(TrackData value, $Res Function(TrackData) then) =
      _$TrackDataCopyWithImpl<$Res, TrackData>;
  @useResult
  $Res call(
      {List<TrackInitFIS> group,
      int time,
      int windowSize,
      double possibility,
      double speed,
      double hr,
      List<bool> resultWindow,
      DateTime lastTickTime,
      int index});
}

/// @nodoc
class _$TrackDataCopyWithImpl<$Res, $Val extends TrackData>
    implements $TrackDataCopyWith<$Res> {
  _$TrackDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? group = null,
    Object? time = null,
    Object? windowSize = null,
    Object? possibility = null,
    Object? speed = null,
    Object? hr = null,
    Object? resultWindow = null,
    Object? lastTickTime = null,
    Object? index = null,
  }) {
    return _then(_value.copyWith(
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as List<TrackInitFIS>,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      windowSize: null == windowSize
          ? _value.windowSize
          : windowSize // ignore: cast_nullable_to_non_nullable
              as int,
      possibility: null == possibility
          ? _value.possibility
          : possibility // ignore: cast_nullable_to_non_nullable
              as double,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      hr: null == hr
          ? _value.hr
          : hr // ignore: cast_nullable_to_non_nullable
              as double,
      resultWindow: null == resultWindow
          ? _value.resultWindow
          : resultWindow // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      lastTickTime: null == lastTickTime
          ? _value.lastTickTime
          : lastTickTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TrackDataCopyWith<$Res> implements $TrackDataCopyWith<$Res> {
  factory _$$_TrackDataCopyWith(
          _$_TrackData value, $Res Function(_$_TrackData) then) =
      __$$_TrackDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TrackInitFIS> group,
      int time,
      int windowSize,
      double possibility,
      double speed,
      double hr,
      List<bool> resultWindow,
      DateTime lastTickTime,
      int index});
}

/// @nodoc
class __$$_TrackDataCopyWithImpl<$Res>
    extends _$TrackDataCopyWithImpl<$Res, _$_TrackData>
    implements _$$_TrackDataCopyWith<$Res> {
  __$$_TrackDataCopyWithImpl(
      _$_TrackData _value, $Res Function(_$_TrackData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? group = null,
    Object? time = null,
    Object? windowSize = null,
    Object? possibility = null,
    Object? speed = null,
    Object? hr = null,
    Object? resultWindow = null,
    Object? lastTickTime = null,
    Object? index = null,
  }) {
    return _then(_$_TrackData(
      group: null == group
          ? _value._group
          : group // ignore: cast_nullable_to_non_nullable
              as List<TrackInitFIS>,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      windowSize: null == windowSize
          ? _value.windowSize
          : windowSize // ignore: cast_nullable_to_non_nullable
              as int,
      possibility: null == possibility
          ? _value.possibility
          : possibility // ignore: cast_nullable_to_non_nullable
              as double,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      hr: null == hr
          ? _value.hr
          : hr // ignore: cast_nullable_to_non_nullable
              as double,
      resultWindow: null == resultWindow
          ? _value._resultWindow
          : resultWindow // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      lastTickTime: null == lastTickTime
          ? _value.lastTickTime
          : lastTickTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      index: null == index
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
      this.time = 0,
      this.windowSize = 4,
      this.possibility = 0,
      this.speed = 1,
      this.hr = 0,
      required final List<bool> resultWindow,
      required this.lastTickTime,
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
    if (_group is EqualUnmodifiableListView) return _group;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_group);
  }

  @override
  @JsonKey()
  final int time;
  @override
  @JsonKey()
  final int windowSize;
  @override
  @JsonKey()
  final double possibility;

  /// speed in m/s
  @override
  @JsonKey()
  final double speed;
  @override
  @JsonKey()
  final double hr;
  final List<bool> _resultWindow;
  @override
  List<bool> get resultWindow {
    if (_resultWindow is EqualUnmodifiableListView) return _resultWindow;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_resultWindow);
  }

  @override
  final DateTime lastTickTime;
  @override
  final int index;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrackData(group: $group, time: $time, windowSize: $windowSize, possibility: $possibility, speed: $speed, hr: $hr, resultWindow: $resultWindow, lastTickTime: $lastTickTime, index: $index)';
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
      ..add(DiagnosticsProperty('speed', speed))
      ..add(DiagnosticsProperty('hr', hr))
      ..add(DiagnosticsProperty('resultWindow', resultWindow))
      ..add(DiagnosticsProperty('lastTickTime', lastTickTime))
      ..add(DiagnosticsProperty('index', index));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TrackData &&
            const DeepCollectionEquality().equals(other._group, _group) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.windowSize, windowSize) ||
                other.windowSize == windowSize) &&
            (identical(other.possibility, possibility) ||
                other.possibility == possibility) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.hr, hr) || other.hr == hr) &&
            const DeepCollectionEquality()
                .equals(other._resultWindow, _resultWindow) &&
            (identical(other.lastTickTime, lastTickTime) ||
                other.lastTickTime == lastTickTime) &&
            (identical(other.index, index) || other.index == index));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_group),
      time,
      windowSize,
      possibility,
      speed,
      hr,
      const DeepCollectionEquality().hash(_resultWindow),
      lastTickTime,
      index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      final int time,
      final int windowSize,
      final double possibility,
      final double speed,
      final double hr,
      required final List<bool> resultWindow,
      required final DateTime lastTickTime,
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

  /// speed in m/s
  double get speed;
  @override
  double get hr;
  @override
  List<bool> get resultWindow;
  @override
  DateTime get lastTickTime;
  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$_TrackDataCopyWith<_$_TrackData> get copyWith =>
      throw _privateConstructorUsedError;
}
