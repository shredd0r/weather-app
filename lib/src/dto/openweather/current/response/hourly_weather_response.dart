

import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/dto/openweather/current/response/innermodelinresponse/city_info_detail_dto.dart';

import 'innermodelinresponse/base/base_city_info_dto.dart';
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
  late CityInfoDetailDto cityInfoDto;

  HourlyWeatherOpenWeatherResponseDto(
      this.cod,
      this.message,
      this.cnt,
      this.listHourlyInfo,
      this.cityInfoDto);

  factory HourlyWeatherOpenWeatherResponseDto.fromJson(Map<String, dynamic> json) => _$HourlyWeatherOpenWeatherResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$HourlyWeatherOpenWeatherResponseDtoToJson(this);
}