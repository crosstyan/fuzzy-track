import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'track_init_fis.freezed.dart';
part 'track_init_fis.g.dart';

@freezed
class TrackInitFIS with _$TrackInitFIS {
  @JsonSerializable(fieldRename: FieldRename.pascal, explicitToJson: true)
  const factory TrackInitFIS({
    @Default(Duration(milliseconds: 100)) Duration delay,
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