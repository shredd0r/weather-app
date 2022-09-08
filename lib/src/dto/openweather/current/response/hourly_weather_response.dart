

import 'package:json_annotation/json_annotation.dart';

import 'innermodelinresponse/city_info_dto.dart';
import 'innermodelinresponse/hourly_info.dart';

part 'hourly_weather_response.g.dart';

@JsonSerializable()
class HourlyWeatherOpenWeatherResponseDto {

  late int cod;

  late int message;

  late int cnt;

  @JsonKey(name: "list")
  late List<HourlyInfoDto> listHourlyInfo;

  @JsonKey(name: "city")
  late CityInfoDto cityInfoDto;

  late String country;

  late int population;

  late int timezone;

  late int sunrise;

  late int sunset;

  HourlyWeatherOpenWeatherResponseDto(
      this.cod,
      this.message,
      this.cnt,
      this.listHourlyInfo,
      this.cityInfoDto,
      this.country,
      this.population,
      this.timezone,
      this.sunrise,
      this.sunset);

  factory HourlyWeatherOpenWeatherResponseDto.fromJson(Map<String, dynamic> json) => _$HourlyWeatherOpenWeatherResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$HourlyWeatherOpenWeatherResponseDtoToJson(this);
}