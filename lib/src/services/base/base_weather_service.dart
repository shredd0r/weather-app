import 'package:weather_app/src/models/current_weather_model.dart';

import 'package:weather_app/src/models/daily_weather_model.dart';
import 'package:weather_app/src/models/hourly_weather_model.dart';

abstract class WeatherService {

  CurrentWeatherModel getCurrentWeatherInfo();
  List<HourlyWeatherModel> getHourlyWeatherInfo();
  List<DailyWeatherModel> getDailyWeatherInfo();

}