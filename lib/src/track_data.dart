// This file is "main.dart"
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fuzzy_track/fuzzy_track.dart';

part 'track_data.freezed.dart';
part 'track_data.g.dart';

/// a pure data class for the representation of the result of [SpeedHrController]
/// also used in
@freezed
class SpeedHrState with _$SpeedHrState {
  @Assert('time >= 0')
  @Assert('stability > 0')
  @Assert('index >= 0')
  @JsonSerializable(fieldRename: FieldRename.pascal, explicitToJson: true)
  const factory SpeedHrState({
    required List<SpeedHrFISParams> group,
    @Default(0) int time,
    @Default(4) int stability,
    @Default(0) double possibility,

    /// speed in m/s
    @Default(1) double speed,
    @Default(0) double hr,
    required List<bool> resultWindow,
    required DateTime lastTickTime,
    required int index,
  }) = _SpeedHrState;

  factory SpeedHrState.fromJson(Map<String, Object?> json) =>
      _$SpeedHrStateFromJson(json);
}
