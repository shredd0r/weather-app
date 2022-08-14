// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordinationModel _$CoordinationModelFromJson(Map<String, dynamic> json) =>
    CoordinationModel(
      lon: (json['lon'] as num?)?.toDouble(),
      lat: (json['lat'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoordinationModelToJson(CoordinationModel instance) =>
    <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
    };
