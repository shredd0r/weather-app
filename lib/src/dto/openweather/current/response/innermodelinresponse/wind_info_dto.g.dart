// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wind_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WindInfoDto _$WindInfoDtoFromJson(Map<String, dynamic> json) =>
    WindInfoDto(
      speed: (json['speed'] as num?)?.toDouble(),
      degrees: (json['deg'] as num?)?.toDouble(),
      gust: (json['gust'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WindInfoDtoToJson(WindInfoDto instance) =>
    <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.degrees,
      'gust': instance.gust,
    };
