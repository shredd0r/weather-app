import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/dto/accuweather/response/inner_dto/headline_dto.dart';
import 'package:weather_app/src/dto/accuweather/response/inner_dto/daily_forecast_dto.dart';

part 'daily_weather_response_dto.g.dart';

@JsonSerializable()
class DailyWeatherAccuWeatherResponseDto {

  late HeadLineDto headline;
  late List<DailyForecastAccuWeatherDto> dailyForecasts;

  DailyWeatherAccuWeatherResponseDto(
    this.headline,
    this.dailyForecasts);
}