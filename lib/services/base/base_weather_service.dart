import 'package:weather_app/models/current_weather_model.dart';

import '../../models/daily_weather_model.dart';
import '../../models/hourly_weather_model.dart';

abstract class WeatherService {

  CurrentWeatherModel getCurrentWeatherInfo();
  List<HourlyWeatherModel> getHourlyWeatherInfo();
  List<DailyWeatherModel> getDailyWeatherInfo();

}