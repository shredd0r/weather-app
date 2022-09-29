import 'package:weather_app/src/dto/config/config_apikey_dto.dart';

abstract class ConfigurationRepository {

  void load();

  String getOpenWeatherApiKey();
  String getAccuWeatherApiKey();
  String getTheWeatherApiKey();
  String getNinjasApiKey();

  void saveOpenWeatherApiKey(String newApiKey);
  void saveAccuWeatherApiKey(String newApiKey);
  void saveTheWeatherApiKey(String newApiKey);
}