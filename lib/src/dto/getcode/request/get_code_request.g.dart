// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_code_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCodeRequestDto _$GetCodeRequestDtoFromJson(Map<String, dynamic> json) =>
    GetCodeRequestDto(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      localityLanguage: json['localityLanguage'] as String?,
    );

Map<String, dynamic> _$GetCodeRequestDtoToJson(GetCodeRequestDto instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'localityLanguage': instance.localityLanguage,
    };
