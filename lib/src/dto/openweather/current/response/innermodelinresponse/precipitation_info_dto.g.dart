// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'precipitation_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrecipitationInfoDto _$PrecipitationInfoDtoFromJson(
        Map<String, dynamic> json) =>
    PrecipitationInfoDto(
      volumeLastThreeHour: (json['3h'] as num?)?.toDouble(),
      volumeLastOneHour: (json['1h'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PrecipitationInfoDtoToJson(
        PrecipitationInfoDto instance) =>
    <String, dynamic>{
      '1h': instance.volumeLastOneHour,
      '3h': instance.volumeLastThreeHour,
    };
