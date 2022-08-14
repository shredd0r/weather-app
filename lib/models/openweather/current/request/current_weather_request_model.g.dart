// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherOpenWeatherRequestModel
    _$CurrentWeatherOpenWeatherRequestModelFromJson(
            Map<String, dynamic> json) =>
        CurrentWeatherOpenWeatherRequestModel(
          latitude: (json['lat'] as num).toDouble(),
          longitude: (json['lon'] as num).toDouble(),
          appId: json['appid'] as String,
          units: json['units'] as String?,
          lang: json['lang'] as String?,
        );

Map<String, dynamic> _$CurrentWeatherOpenWeatherRequestModelToJson(
        CurrentWeatherOpenWeatherRequestModel instance) =>
    <String, dynamic>{
      'lat': instance.latitude.toString(),
      'lon': instance.longitude.toString(),
      'appid': instance.appId,
      'units': instance.units,
      'lang': instance.lang,
    };
