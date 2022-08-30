// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherOpenWeatherResponseDto
    _$CurrentWeatherOpenWeatherResponseDtoFromJson(
            Map<String, dynamic> json) =>
        CurrentWeatherOpenWeatherResponseDto(
          coordination: json['coord'] == null
              ? null
              : CoordinationDto.fromJson(
                  json['coord'] as Map<String, dynamic>),
          weather: (json['weather'] as List<dynamic>?)
              ?.map((e) => WeatherDto.fromJson(e as Map<String, dynamic>))
              .toList(),
          base: json['base'] as String,
          mainInfoModel: json['main'] == null
              ? null
              : MainInfoDto.fromJson(json['main'] as Map<String, dynamic>),
          visibility: json['visibility'] as int,
          wind: json['wind'] == null
              ? null
              : WindInfoDto.fromJson(json['wind'] as Map<String, dynamic>),
          clouds: json['clouds'] == null
              ? null
              : CloudInfoDto.fromJson(json['clouds'] as Map<String, dynamic>),
          rainPrecipitationInfoModel: json['rain'] == null
              ? null
              : PrecipitationInfoDto.fromJson(
                  json['rain'] as Map<String, dynamic>),
          snowPrecipitationInfoModel: json['snow'] == null
              ? null
              : PrecipitationInfoDto.fromJson(
                  json['snow'] as Map<String, dynamic>),
          timeOfCalculationData: json['dt'] as int,
          systemInfoModel: json['sys'] == null
              ? null
              : SystemInfoDto.fromJson(json['sys'] as Map<String, dynamic>),
          timezone: json['timezone'] as int,
          id: json['id'] as int,
          cityName: json['name'] as String,
          cod: json['cod'] as int,
        );

Map<String, dynamic> _$CurrentWeatherOpenWeatherResponseDtoToJson(
        CurrentWeatherOpenWeatherResponseDto instance) =>
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
