import 'package:json_annotation/json_annotation.dart';

part 'weather_dto.g.dart';

@JsonSerializable()
class WeatherInfoDto {

  late int? id;
  late String? main;
  late String? description;
  late String? icon;

  WeatherInfoDto(
      {
        this.id,
        this.main,
        this.description,
        this.icon
      });

  factory WeatherInfoDto.fromJson(Map<String, dynamic> json) => _$WeatherInfoDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherInfoDtoToJson(this);
}