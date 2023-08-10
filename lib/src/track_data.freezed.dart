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

SpeedHrState _$SpeedHrStateFromJson(Map<String, dynamic> json) {
  return _SpeedHrState.fromJson(json);
}

/// @nodoc
mixin _$SpeedHrState {
  List<SpeedHrFISParams> get group => throw _privateConstructorUsedError;
  int get time => throw _privateConstructorUsedError;
  int get stability => throw _privateConstructorUsedError;
  double get possibility => throw _privateConstructorUsedError;

  /// speed in m/s
  double get speed => throw _privateConstructorUsedError;
  double get hr => throw _privateConstructorUsedError;
  List<bool> get resultWindow => throw _privateConstructorUsedError;
  DateTime get lastTickTime => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpeedHrStateCopyWith<SpeedHrState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpeedHrStateCopyWith<$Res> {
  factory $SpeedHrStateCopyWith(
          SpeedHrState value, $Res Function(SpeedHrState) then) =
      _$SpeedHrStateCopyWithImpl<$Res, SpeedHrState>;
  @useResult
  $Res call(
      {List<SpeedHrFISParams> group,
      int time,
      int stability,
      double possibility,
      double speed,
      double hr,
      List<bool> resultWindow,
      DateTime lastTickTime,
      int index});
}

/// @nodoc
class _$SpeedHrStateCopyWithImpl<$Res, $Val extends SpeedHrState>
    implements $SpeedHrStateCopyWith<$Res> {
  _$SpeedHrStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? group = null,
    Object? time = null,
    Object? stability = null,
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
              as List<SpeedHrFISParams>,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      stability: null == stability
          ? _value.stability
          : stability // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_SpeedHrStateCopyWith<$Res>
    implements $SpeedHrStateCopyWith<$Res> {
  factory _$$_SpeedHrStateCopyWith(
          _$_SpeedHrState value, $Res Function(_$_SpeedHrState) then) =
      __$$_SpeedHrStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SpeedHrFISParams> group,
      int time,
      int stability,
      double possibility,
      double speed,
      double hr,
      List<bool> resultWindow,
      DateTime lastTickTime,
      int index});
}

/// @nodoc
class __$$_SpeedHrStateCopyWithImpl<$Res>
    extends _$SpeedHrStateCopyWithImpl<$Res, _$_SpeedHrState>
    implements _$$_SpeedHrStateCopyWith<$Res> {
  __$$_SpeedHrStateCopyWithImpl(
      _$_SpeedHrState _value, $Res Function(_$_SpeedHrState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? group = null,
    Object? time = null,
    Object? stability = null,
    Object? possibility = null,
    Object? speed = null,
    Object? hr = null,
    Object? resultWindow = null,
    Object? lastTickTime = null,
    Object? index = null,
  }) {
    return _then(_$_SpeedHrState(
      group: null == group
          ? _value._group
          : group // ignore: cast_nullable_to_non_nullable
              as List<SpeedHrFISParams>,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      stability: null == stability
          ? _value.stability
          : stability // ignore: cast_nullable_to_non_nullable
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
class _$_SpeedHrState with DiagnosticableTreeMixin implements _SpeedHrState {
  const _$_SpeedHrState(
      {required final List<SpeedHrFISParams> group,
      this.time = 0,
      this.stability = 4,
      this.possibility = 0,
      this.speed = 1,
      this.hr = 0,
      required final List<bool> resultWindow,
      required this.lastTickTime,
      required this.index})
      : assert(time >= 0),
        assert(stability > 0),
        assert(index >= 0),
        _group = group,
        _resultWindow = resultWindow;

  factory _$_SpeedHrState.fromJson(Map<String, dynamic> json) =>
      _$$_SpeedHrStateFromJson(json);

  final List<SpeedHrFISParams> _group;
  @override
  List<SpeedHrFISParams> get group {
    if (_group is EqualUnmodifiableListView) return _group;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_group);
  }

  @override
  @JsonKey()
  final int time;
  @override
  @JsonKey()
  final int stability;
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
    return 'SpeedHrState(group: $group, time: $time, stability: $stability, possibility: $possibility, speed: $speed, hr: $hr, resultWindow: $resultWindow, lastTickTime: $lastTickTime, index: $index)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SpeedHrState'))
      ..add(DiagnosticsProperty('group', group))
      ..add(DiagnosticsProperty('time', time))
      ..add(DiagnosticsProperty('stability', stability))
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
            other is _$_SpeedHrState &&
            const DeepCollectionEquality().equals(other._group, _group) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.stability, stability) ||
                other.stability == stability) &&
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
      stability,
      possibility,
      speed,
      hr,
      const DeepCollectionEquality().hash(_resultWindow),
      lastTickTime,
      index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SpeedHrStateCopyWith<_$_SpeedHrState> get copyWith =>
      __$$_SpeedHrStateCopyWithImpl<_$_SpeedHrState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SpeedHrStateToJson(
      this,
    );
  }
}

abstract class _SpeedHrState implements SpeedHrState {
  const factory _SpeedHrState(
      {required final List<SpeedHrFISParams> group,
      final int time,
      final int stability,
      final double possibility,
      final double speed,
      final double hr,
      required final List<bool> resultWindow,
      required final DateTime lastTickTime,
      required final int index}) = _$_SpeedHrState;

  factory _SpeedHrState.fromJson(Map<String, dynamic> json) =
      _$_SpeedHrState.fromJson;

  @override
  List<SpeedHrFISParams> get group;
  @override
  int get time;
  @override
  int get stability;
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
  _$$_SpeedHrStateCopyWith<_$_SpeedHrState> get copyWith =>
      throw _privateConstructorUsedError;
}
