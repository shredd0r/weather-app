// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordination_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordinationDto _$CoordinationDtoFromJson(Map<String, dynamic> json) =>
    CoordinationDto(
      lon: (json['lon'] as num?)?.toDouble(),
      lat: (json['lat'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoordinationDtoToJson(CoordinationDto instance) =>
    <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
    };
