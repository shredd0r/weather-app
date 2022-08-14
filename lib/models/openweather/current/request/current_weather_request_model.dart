import 'package:json_annotation/json_annotation.dart';

part 'current_weather_request_model.g.dart';

@JsonSerializable()
class CurrentWeatherOpenWeatherRequestModel {
  @JsonKey(name: "lat")
  late double latitude;
  @JsonKey(name: "lon")
  late double longitude;
  @JsonKey(name: "appid")
  late String appId;
  late String? units;
  late String? lang;

  double get getLatitude {return latitude;}

  CurrentWeatherOpenWeatherRequestModel({
    required this.latitude,
    required this.longitude,
    required this.appId,
    this.units,
    this.lang
  });

  factory CurrentWeatherOpenWeatherRequestModel.fromJson(Map<String, dynamic> json) => _$CurrentWeatherOpenWeatherRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentWeatherOpenWeatherRequestModelToJson(this);
}