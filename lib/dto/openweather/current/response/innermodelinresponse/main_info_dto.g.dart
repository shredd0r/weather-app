// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainInfoDto _$MainInfoDtoFromJson(Map<String, dynamic> json) =>
    MainInfoDto(
      temperature: (json['temp'] as num?)?.toDouble(),
      feelsLike: (json['feels_like'] as num?)?.toDouble(),
      minTemperature: (json['temp_min'] as num?)?.toDouble(),
      maxTemperature: (json['temp_max'] as num?)?.toDouble(),
      pressure: (json['pressure'] as num?)?.toDouble(),
      humidity: json['humidity'] as int?,
    );

Map<String, dynamic> _$MainInfoDtoToJson(MainInfoDto instance) =>
    <String, dynamic>{
      'temp': instance.temperature,
      'feels_like': instance.feelsLike,
      'temp_min': instance.minTemperature,
      'temp_max': instance.maxTemperature,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };
