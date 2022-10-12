
import 'package:json_annotation/json_annotation.dart';

part 'weather_request_dto.g.dart';

@JsonSerializable()
class WeatherAccuWeatherRequestDto {

  @JsonKey(name: "apiKey")
  late String appId;
  late String language;
  late bool metric = true;
  late bool? details;

  WeatherAccuWeatherRequestDto(this.appId, {
    required this.language,
    this.details,
    this.metric = true});

  factory WeatherAccuWeatherRequestDto.fromJson(Map<String, dynamic> json) => _$WeatherAccuWeatherRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherAccuWeatherRequestDtoToJson(this);
}