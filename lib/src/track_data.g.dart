// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SpeedHrState _$$_SpeedHrStateFromJson(Map<String, dynamic> json) =>
    _$_SpeedHrState(
      group: (json['Group'] as List<dynamic>)
          .map((e) => SpeedHrFISParams.fromJson(e as Map<String, dynamic>))
          .toList(),
      time: json['Time'] as int? ?? 0,
      stability: json['Stability'] as int? ?? 4,
      possibility: (json['Possibility'] as num?)?.toDouble() ?? 0,
      speed: (json['Speed'] as num?)?.toDouble() ?? 1,
      hr: (json['Hr'] as num?)?.toDouble() ?? 0,
      resultWindow: (json['ResultWindow'] as List<dynamic>)
          .map((e) => e as bool)
          .toList(),
      lastTickTime: DateTime.parse(json['LastTickTime'] as String),
      index: json['Index'] as int,
    );

Map<String, dynamic> _$$_SpeedHrStateToJson(_$_SpeedHrState instance) =>
    <String, dynamic>{
      'Group': instance.group.map((e) => e.toJson()).toList(),
      'Time': instance.time,
      'Stability': instance.stability,
      'Possibility': instance.possibility,
      'Speed': instance.speed,
      'Hr': instance.hr,
      'ResultWindow': instance.resultWindow,
      'LastTickTime': instance.lastTickTime.toIso8601String(),
      'Index': instance.index,
    };
