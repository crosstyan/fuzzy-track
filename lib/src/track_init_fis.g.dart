// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_init_fis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TrackInitFIS _$$_TrackInitFISFromJson(Map<String, dynamic> json) =>
    _$_TrackInitFIS(
      delay: json['Delay'] == null
          ? const Duration(milliseconds: 100)
          : Duration(microseconds: json['Delay'] as int),
      lengthMeter: (json['LengthMeter'] as num?)?.toDouble() ?? 0.1,
      baseHR: (json['BaseHR'] as num?)?.toDouble() ?? 60,
      targetHRMul: (json['TargetHRMul'] as num?)?.toDouble() ?? 1.5,
      lowHRMul: (json['LowHRMul'] as num?)?.toDouble() ?? 1,
      highHRMul: (json['HighHRMul'] as num?)?.toDouble() ?? 2,
      sigmaHR: (json['SigmaHR'] as num?)?.toDouble() ?? 10,
      shortFoot: (json['ShortFoot'] as num?)?.toDouble() ?? 30,
      longShoulder: (json['LongShoulder'] as num?)?.toDouble() ?? 30,
      longFoot: (json['LongFoot'] as num?)?.toDouble() ?? 0,
      sigmaResult: (json['SigmaResult'] as num?)?.toDouble() ?? 10,
    );

Map<String, dynamic> _$$_TrackInitFISToJson(_$_TrackInitFIS instance) =>
    <String, dynamic>{
      'Delay': instance.delay.inMicroseconds,
      'LengthMeter': instance.lengthMeter,
      'BaseHR': instance.baseHR,
      'TargetHRMul': instance.targetHRMul,
      'LowHRMul': instance.lowHRMul,
      'HighHRMul': instance.highHRMul,
      'SigmaHR': instance.sigmaHR,
      'ShortFoot': instance.shortFoot,
      'LongShoulder': instance.longShoulder,
      'LongFoot': instance.longFoot,
      'SigmaResult': instance.sigmaResult,
    };
