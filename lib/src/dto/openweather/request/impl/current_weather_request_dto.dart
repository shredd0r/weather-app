import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/dto/openweather/request/base_weather_request.dart';

part 'current_weather_request_dto.g.dart';

@JsonSerializable()
class CurrentWeatherOpenWeatherRequestDto extends BaseWeatherRequestDto {

  late String? units;
  late String? lang;

  CurrentWeatherOpenWeatherRequestDto({
    latitude,
    longitude,
    appId,
    this.units = "metric",
    this.lang
  }) : super(latitude, longitude, appId);

  factory CurrentWeatherOpenWeatherRequestDto.fromJson(Map<String, dynamic> json) => _$CurrentWeatherOpenWeatherRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentWeatherOpenWeatherRequestDtoToJson(this);
}