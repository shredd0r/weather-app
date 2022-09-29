
import 'package:json_annotation/json_annotation.dart';
import 'cloud_info_dto.dart';
import 'main_info_dto.dart';
import 'precipitation_info_dto.dart';
import 'system_info_pod_info.dart';
import 'weather_dto.dart';
import 'wind_info_dto.dart';

part 'hourly_info.g.dart';

@JsonSerializable()
class HourlyInfoDto {

  @JsonKey(name: "dt")
  late int datetimeForecasted;

  @JsonKey(name: "main")
  late MainInfoDto? mainInfoDto;

  @JsonKey(name: "weather")
  late List<WeatherInfoDto> weatherInfoDtoList;

  @JsonKey(name: "clouds")
  late CloudInfoDto cloudInfoDto;

  @JsonKey(name: "wind")
  late WindInfoDto windInfoDto;

  late int visibility;

  @JsonKey(name: "pop")
  late double probabilityOfPrecipitation;

  @JsonKey(name: "rain")
  late PrecipitationInfoDto? precipitationInfoDtoForRain;

  @JsonKey(name: "snow")
  late PrecipitationInfoDto? precipitationInfoDtoForSnow;

  @JsonKey(name: "sys")
  late SystemPodInfoDto systemInfoDto;

  @JsonKey(name: "dt_txt")
  late String datetimeISO;

  HourlyInfoDto(
      this.datetimeForecasted,
      this.mainInfoDto,
      this.weatherInfoDtoList,
      this.cloudInfoDto,
      this.windInfoDto,
      this.visibility,
      this.probabilityOfPrecipitation,
      this.precipitationInfoDtoForRain,
      this.precipitationInfoDtoForSnow,
      this.systemInfoDto,
      this.datetimeISO);


  factory HourlyInfoDto.fromJson(Map<String, dynamic> json) => _$HourlyInfoDtoFromJson(json);
  Map<String, dynamic> toJson() => _$HourlyInfoDtoToJson(this);
}