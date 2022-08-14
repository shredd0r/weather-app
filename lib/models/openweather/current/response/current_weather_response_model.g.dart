// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherOpenWeatherResponseModel
    _$CurrentWeatherOpenWeatherResponseModelFromJson(
            Map<String, dynamic> json) =>
        CurrentWeatherOpenWeatherResponseModel(
          coordination: json['coord'] == null
              ? null
              : CoordinationModel.fromJson(
                  json['coord'] as Map<String, dynamic>),
          weather: (json['weather'] as List<dynamic>?)
              ?.map((e) => WeatherModel.fromJson(e as Map<String, dynamic>))
              .toList(),
          base: json['base'] as String,
          mainInfoModel: json['main'] == null
              ? null
              : MainInfoModel.fromJson(json['main'] as Map<String, dynamic>),
          visibility: json['visibility'] as int,
          wind: json['wind'] == null
              ? null
              : WindInfoModel.fromJson(json['wind'] as Map<String, dynamic>),
          clouds: json['clouds'] == null
              ? null
              : CloudInfoModel.fromJson(json['clouds'] as Map<String, dynamic>),
          rainPrecipitationInfoModel: json['rain'] == null
              ? null
              : PrecipitationInfoModel.fromJson(
                  json['rain'] as Map<String, dynamic>),
          snowPrecipitationInfoModel: json['snow'] == null
              ? null
              : PrecipitationInfoModel.fromJson(
                  json['snow'] as Map<String, dynamic>),
          timeOfCalculationData: json['dt'] as int,
          systemInfoModel: json['sys'] == null
              ? null
              : SystemInfoModel.fromJson(json['sys'] as Map<String, dynamic>),
          timezone: json['timezone'] as int,
          id: json['id'] as int,
          cityName: json['name'] as String,
          cod: json['cod'] as int,
        );

Map<String, dynamic> _$CurrentWeatherOpenWeatherResponseModelToJson(
        CurrentWeatherOpenWeatherResponseModel instance) =>
    <String, dynamic>{
      'coord': instance.coordination,
      'weather': instance.weather,
      'base': instance.base,
      'main': instance.mainInfoModel,
      'visibility': instance.visibility,
      'wind': instance.wind,
      'clouds': instance.clouds,
      'rain': instance.rainPrecipitationInfoModel,
      'snow': instance.snowPrecipitationInfoModel,
      'dt': instance.timeOfCalculationData,
      'sys': instance.systemInfoModel,
      'timezone': instance.timezone,
      'id': instance.id,
      'name': instance.cityName,
      'cod': instance.cod,
    };
