import 'package:weather_app/src/entity/provider_info.dart';
import 'package:weather_app/src/entity/weather_settings.dart';
import 'package:weather_app/src/static/weather_provider_enum.dart';

abstract class ConfigurationRepository {

  String getNinjasApiKey();

  int getFavoriteCitySettings();
  void setFavoriteCitySettings(int id);

  WeatherProvides getWeatherProviders(WeatherProvider id);

  CitySettings getCitySetting(int id);
  List<CitySettings> getAllCitySettings();

  void saveOpenWeatherApiKey(String newApiKey);
  void saveAccuWeatherApiKey(String newApiKey);
}