

import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/dto/openweather/current/request/base_weather_request.dart';

part 'hourly_weather_request.g.dart';

@JsonSerializable()
class HourlyWeatherOpenWeatherRequestDto extends BaseWeatherRequestDto {

  HourlyWeatherOpenWeatherRequestDto(super.latitude, super.longitude, super.appId);

  factory HourlyWeatherOpenWeatherRequestDto.fromJson(Map<String, dynamic> json) => _$HourlyWeatherOpenWeatherRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$HourlyWeatherOpenWeatherRequestDtoToJson(this);
}