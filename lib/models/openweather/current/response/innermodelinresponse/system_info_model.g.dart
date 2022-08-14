// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemInfoModel _$SystemInfoModelFromJson(Map<String, dynamic> json) =>
    SystemInfoModel(
      type: json['type'] as int?,
      id: json['id'] as int?,
      message: (json['message'] as num?)?.toDouble(),
      country: json['country'] as String?,
      sunrise: json['sunrise'] as int?,
      sunset: json['sunset'] as int?,
    );

Map<String, dynamic> _$SystemInfoModelToJson(SystemInfoModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'message': instance.message,
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
