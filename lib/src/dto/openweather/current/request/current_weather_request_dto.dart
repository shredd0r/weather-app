import 'package:json_annotation/json_annotation.dart';

part 'current_weather_request_dto.g.dart';

@JsonSerializable()
class CurrentWeatherOpenWeatherRequestDto {
  @JsonKey(name: "lat")
  late double latitude;
  @JsonKey(name: "lon")
  late double longitude;
  @JsonKey(name: "appid")
  late String appId;
  late String? units;
  late String? lang;

  double get getLatitude {return latitude;}

  CurrentWeatherOpenWeatherRequestDto({
    required this.latitude,
    required this.longitude,
    required this.appId,
    this.units,
    this.lang
  });

  factory CurrentWeatherOpenWeatherRequestDto.fromJson(Map<String, dynamic> json) => _$CurrentWeatherOpenWeatherRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentWeatherOpenWeatherRequestDtoToJson(this);
}