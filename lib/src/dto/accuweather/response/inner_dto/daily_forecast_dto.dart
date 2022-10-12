import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/dto/accuweather/response/inner_dto/day_info_dto.dart';
import 'package:weather_app/src/dto/accuweather/response/inner_dto/temperature_info_dto.dart';

part 'daily_forecast_dto.g.dart';

@JsonSerializable()
class DailyForecastAccuWeatherDto {

  late String date;
  late int epochDate;
  late TemperatureDetailInfoDto temperature;
  late DayInfoDto day;
  late DayInfoDto night;
  late List<String> sources;
  late String mobileLink;
  late String link;

  DailyForecastAccuWeatherDto(
    this.date,
    this.epochDate,
    this.temperature,
    this.day,
    this.night,
    this.sources,
    this.mobileLink,
    this.link);

  factory DailyForecastAccuWeatherDto.fromJson(Map<String, dynamic> json) => _$DailyForecastAccuWeatherDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DailyForecastAccuWeatherDtoToJson(this);
}