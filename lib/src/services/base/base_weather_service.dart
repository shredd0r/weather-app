import 'package:weather_app/src/models/current_weather_model.dart';

import 'package:weather_app/src/models/daily_weather_model.dart';
import 'package:weather_app/src/models/hourly_weather_model.dart';
import 'package:weather_app/src/services/repositories/base/configuration_repository.dart';

abstract class WeatherService {

  final ConfigurationRepository configurationRepository;

  WeatherService(this.configurationRepository);

  CurrentWeatherModel getCurrentWeatherInfo();
  List<HourlyWeatherModel> getHourlyWeatherInfo();
  List<DailyWeatherModel> getDailyWeatherInfo();

}