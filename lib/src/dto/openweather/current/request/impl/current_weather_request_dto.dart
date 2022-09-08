import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/dto/openweather/current/request/base_weather_request.dart';

part 'current_weather_request_dto.g.dart';

@JsonSerializable()
class CurrentWeatherOpenWeatherRequestDto extends BaseWeatherRequestDto {

  late String? units;
  late String? lang;

  double get getLatitude {return latitude;}

  CurrentWeatherOpenWeatherRequestDto({
    latitude,
    longitude,
    appId,
    this.units,
    this.lang
  }) : super(latitude, longitude, appId);

  factory CurrentWeatherOpenWeatherRequestDto.fromJson(Map<String, dynamic> json) => _$CurrentWeatherOpenWeatherRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentWeatherOpenWeatherRequestDtoToJson(this);
}