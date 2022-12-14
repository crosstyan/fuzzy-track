// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TrackData _$$_TrackDataFromJson(Map<String, dynamic> json) => _$_TrackData(
      group: (json['Group'] as List<dynamic>)
          .map((e) => TrackInitFIS.fromJson(e as Map<String, dynamic>))
          .toList(),
      time: json['Time'] as int? ?? 0,
      windowSize: json['WindowSize'] as int? ?? 4,
      possibility: (json['Possibility'] as num?)?.toDouble() ?? 0,
      delay: json['Delay'] == null
          ? const Duration(milliseconds: 100)
          : Duration(microseconds: json['Delay'] as int),
      hr: (json['Hr'] as num?)?.toDouble() ?? 0,
      resultWindow: (json['ResultWindow'] as List<dynamic>)
          .map((e) => e as bool)
          .toList(),
      lastTickTime: DateTime.parse(json['LastTickTime'] as String),
      index: json['Index'] as int,
    );

Map<String, dynamic> _$$_TrackDataToJson(_$_TrackData instance) =>
    <String, dynamic>{
      'Group': instance.group.map((e) => e.toJson()).toList(),
      'Time': instance.time,
      'WindowSize': instance.windowSize,
      'Possibility': instance.possibility,
      'Delay': instance.delay.inMicroseconds,
      'Hr': instance.hr,
      'ResultWindow': instance.resultWindow,
      'LastTickTime': instance.lastTickTime.toIso8601String(),
      'Index': instance.index,
    };
