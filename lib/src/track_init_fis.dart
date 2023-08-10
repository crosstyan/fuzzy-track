import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fuzzy_track/fuzzy_track.dart';

part 'track_init_fis.freezed.dart';
part 'track_init_fis.g.dart';

/// a pure data class for init [SpeedHrFIS]
@freezed
class SpeedHrFISParams with _$SpeedHrFISParams {
  @JsonSerializable(fieldRename: FieldRename.pascal, explicitToJson: true)
  const factory SpeedHrFISParams({
    @Default(1) double speed,
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

  factory SpeedHrFISParams.fromJson(Map<String, dynamic> json) =>
      _$SpeedHrFISParamsFromJson(json);
}

/// like [SpeedHrBaseFIS] but with actual speed parameter for control the strip
/// and can be serialized/deserialized with [SpeedHrFISParams]
class SpeedHrFIS extends SpeedHrBaseFIS {
  /// Speed in m/s
  final double speed;

  get speedKmh => speed * 3.6;

  SpeedHrFIS({
    this.speed = 1,
    super.baseHR,
    super.targetHRMul,
    super.lowHRMul,
    super.highHRMul,
    super.sigmaHR,
    super.shortFoot,
    super.longShoulder,
    super.longFoot,
    super.sigmaResult = 10,
  });

  factory SpeedHrFIS.fromInit(SpeedHrFISParams data) {
    return SpeedHrFIS(
        baseHR: data.baseHR,
        targetHRMul: data.targetHRMul,
        lowHRMul: data.lowHRMul,
        highHRMul: data.highHRMul,
        sigmaHR: data.sigmaHR,
        shortFoot: data.shortFoot,
        longShoulder: data.longShoulder,
        sigmaResult: data.sigmaResult,
        longFoot: data.longFoot,
        speed: data.speed);
  }

  SpeedHrFISParams getInit() {
    return SpeedHrFISParams(
      baseHR: baseHR,
      targetHRMul: targetHRMul,
      lowHRMul: lowHRMul,
      highHRMul: highHRMul,
      sigmaHR: sigmaHR,
      shortFoot: shortFoot,
      longShoulder: longShoulder,
      sigmaResult: sigmaResult,
      longFoot: longFoot,
      speed: speed,
    );
  }
}
