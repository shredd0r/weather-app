import 'package:json_annotation/json_annotation.dart';

part 'config_weather_dto.g.dart';

@JsonSerializable()
class WeatherInfoConfigurationDto {

  late double latitude;
  late double longitude;

  WeatherInfoConfigurationDto(this.latitude, this.longitude);

  Map<String, dynamic> toJson() => _$WeatherInfoConfigurationDtoToJson(this);
  factory WeatherInfoConfigurationDto.fromJson(Map<String, dynamic> json) => _$WeatherInfoConfigurationDtoFromJson(json);
}