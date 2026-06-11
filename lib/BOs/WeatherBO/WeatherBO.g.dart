// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WeatherBO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherBO _$WeatherBOFromJson(Map<String, dynamic> json) => WeatherBO(
      temperature_2m: (json['temperature_2m'] as num?)?.toDouble(),
      weather_code: (json['weather_code'] as num?)?.toInt(),
      is_day: (json['is_day'] as num?)?.toInt(),
    );

Map<String, dynamic> _$WeatherBOToJson(WeatherBO instance) => <String, dynamic>{
      'temperature_2m': instance.temperature_2m,
      'weather_code': instance.weather_code,
      'is_day': instance.is_day,
    };
