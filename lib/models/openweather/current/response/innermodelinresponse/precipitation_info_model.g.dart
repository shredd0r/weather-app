// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'precipitation_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrecipitationInfoModel _$PrecipitationInfoModelFromJson(
        Map<String, dynamic> json) =>
    PrecipitationInfoModel(
      volumeLastThreeHour: (json['3h'] as num?)?.toDouble(),
      volumeLastOneHour: (json['1h'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PrecipitationInfoModelToJson(
        PrecipitationInfoModel instance) =>
    <String, dynamic>{
      '1h': instance.volumeLastOneHour,
      '3h': instance.volumeLastThreeHour,
    };
