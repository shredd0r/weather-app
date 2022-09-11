import 'package:json_annotation/json_annotation.dart';
import '/src/dto/openweather/current/response/innermodelinresponse/wind_info_dto.dart';

import 'innermodelinresponse/cloud_info_dto.dart';
import 'innermodelinresponse/coordination_dto.dart';
import 'innermodelinresponse/main_info_dto.dart';
import 'innermodelinresponse/precipitation_info_dto.dart';
import 'innermodelinresponse/system_info_dto.dart';
import 'innermodelinresponse/weather_dto.dart';

part 'current_weather_response_dto.g.dart';

@JsonSerializable()
class CurrentWeatherOpenWeatherResponseDto {

  @JsonKey(name: "coord")
  late CoordinationDto? coordination;

  late List<WeatherInfoDto> weather;

  late String base;

  @JsonKey(name: "main")
  late MainInfoDto? mainInfoModel;

  late int visibility;

  late WindInfoDto? wind;

  late CloudInfoDto? clouds;

  @JsonKey(name: "rain")
  late PrecipitationInfoDto? rainPrecipitationInfoModel;

  @JsonKey(name: "snow")
  late PrecipitationInfoDto? snowPrecipitationInfoModel;

  @JsonKey(name: "dt")
  late int timeOfCalculationData;

  @JsonKey(name: "sys")
  late SystemInfoDto? systemInfoModel;

  late int timezone;

  late int id;

  @JsonKey(name: "name")
  late String cityName;

  late int cod;

  CurrentWeatherOpenWeatherResponseDto(
      {
        this.coordination,
        required this.weather,
        required this.base,
        this.mainInfoModel,
        required this.visibility,
        this.wind,
        this.clouds,
        this.rainPrecipitationInfoModel,
        this.snowPrecipitationInfoModel,
        required this.timeOfCalculationData,
        this.systemInfoModel,
        required this.timezone,
        required this.id,
        required this.cityName,
        required this.cod
      });

  factory CurrentWeatherOpenWeatherResponseDto.fromJson(Map<String, dynamic> json) => _$CurrentWeatherOpenWeatherResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentWeatherOpenWeatherResponseDtoToJson(this);
}