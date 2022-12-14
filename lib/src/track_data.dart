// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:fuzzy_track/src/track_init_fis.dart';

part 'track_data.freezed.dart';
part 'track_data.g.dart';

@freezed
class TrackData with _$TrackData {
  @Assert('time >= 0')
  @Assert('windowSize > 0')
  @Assert('index >= 0')
  @JsonSerializable(fieldRename: FieldRename.pascal, explicitToJson: true)
  const factory TrackData({
    required List<TrackInitFIS> group,
    @Default(0) int time,
    @Default(4) int windowSize,
    @Default(0) double possibility,
    @Default(Duration(milliseconds: 100)) Duration delay,
    @Default(0) double hr,
    required List<bool> resultWindow,
    required DateTime lastTickTime,
    required int index,
  }) = _TrackData;

  factory TrackData.fromJson(Map<String, Object?> json) => _$TrackDataFromJson(json);
}