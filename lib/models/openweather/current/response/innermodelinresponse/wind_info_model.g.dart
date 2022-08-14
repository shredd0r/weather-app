// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wind_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WindInfoModel _$WindInfoModelFromJson(Map<String, dynamic> json) =>
    WindInfoModel(
      speed: (json['speed'] as num?)?.toDouble(),
      degrees: (json['deg'] as num?)?.toDouble(),
      gust: (json['gust'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WindInfoModelToJson(WindInfoModel instance) =>
    <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.degrees,
      'gust': instance.gust,
    };
