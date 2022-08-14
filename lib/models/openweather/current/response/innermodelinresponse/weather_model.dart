import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {

  late int? id;
  late String? main;
  late String? description;
  late String? icon;

  WeatherModel(
      {
        this.id,
        this.main,
        this.description,
        this.icon
      });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}