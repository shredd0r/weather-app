import 'package:json_annotation/json_annotation.dart';

class BaseWeatherRequestDto {

  @JsonKey(name: "lat")
  late double latitude;

  @JsonKey(name: "lon")
  late double longitude;

  @JsonKey(name: "appid")
  late String appId;

  BaseWeatherRequestDto(this.latitude, this.longitude, this.appId);
}