import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/models/openweather/current/response/innermodelinresponse/wind_info_model.dart';

import 'innermodelinresponse/cloud_info_model.dart';
import 'innermodelinresponse/coordination_model.dart';
import 'innermodelinresponse/main_info_model.dart';
import 'innermodelinresponse/precipitation_info_model.dart';
import 'innermodelinresponse/system_info_model.dart';
import 'innermodelinresponse/weather_model.dart';

part 'current_weather_response_model.g.dart';

@JsonSerializable()
class CurrentWeatherOpenWeatherResponseModel {

  @JsonKey(name: "coord")
  late CoordinationModel? coordination;

  late List<WeatherModel>? weather;

  late String base;

  @JsonKey(name: "main")
  late MainInfoModel? mainInfoModel;

  late int visibility;

  late WindInfoModel? wind;

  late CloudInfoModel? clouds;

  @JsonKey(name: "rain")
  late PrecipitationInfoModel? rainPrecipitationInfoModel;

  @JsonKey(name: "snow")
  late PrecipitationInfoModel? snowPrecipitationInfoModel;

  @JsonKey(name: "dt")
  late int timeOfCalculationData;

  @JsonKey(name: "sys")
  late SystemInfoModel? systemInfoModel;

  late int timezone;

  late int id;

  @JsonKey(name: "name")
  late String cityName;

  late int cod;

  CurrentWeatherOpenWeatherResponseModel(
      {
        this.coordination,
        this.weather,
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

  factory CurrentWeatherOpenWeatherResponseModel.fromJson(Map<String, dynamic> json) => _$CurrentWeatherOpenWeatherResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentWeatherOpenWeatherResponseModelToJson(this);
}