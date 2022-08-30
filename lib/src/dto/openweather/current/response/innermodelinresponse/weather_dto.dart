import 'package:json_annotation/json_annotation.dart';

part 'weather_dto.g.dart';

@JsonSerializable()
class WeatherDto {

  late int? id;
  late String? main;
  late String? description;
  late String? icon;

  WeatherDto(
      {
        this.id,
        this.main,
        this.description,
        this.icon
      });

  factory WeatherDto.fromJson(Map<String, dynamic> json) => _$WeatherDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherDtoToJson(this);
}