import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/dto/accuweather/response/inner_dto/temperature_info_dto.dart';

part 'hourly_weather_response_dto.g.dart';

@JsonSerializable()
class HourlyWeatherAccuWeatherResponseDto {

  late String dateTime;
  late int epochDateTime;
  late int weatherIcon;
  late String iconPhrase;
  late bool hasPrecipitation;
  late bool isDayLight;
  late TemperatureInfoDto temperature;
  late int precipitationProbability;
  late String mobileLink;
  late String link;

  HourlyWeatherAccuWeatherResponseDto(
      this.dateTime,
      this.epochDateTime,
      this.weatherIcon,
      this.iconPhrase,
      this.hasPrecipitation,
      this.isDayLight,
      this.temperature,
      this.precipitationProbability,
      this.mobileLink,
      this.link);
}