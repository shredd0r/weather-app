import 'package:sqflite/sqflite.dart';
import 'package:weather_app/src/entity/provider_info.dart';
import 'package:weather_app/src/entity/weather_settings.dart';
import 'package:weather_app/src/services/repositories/base/configuration_repository.dart';
import 'package:weather_app/src/static/weather_provider_enum.dart';

class ConfigurationSqlLiteRepository extends ConfigurationRepository {

  late Database dataBase;

  ConfigurationSqlLiteRepository() {
    // dataBase = openDatabase("") as Database;
  }

  @override
  List<CitySettings> getAllCitySettings() {
    // TODO: implement getAllCitySettings
    throw UnimplementedError();
  }

  @override
  CitySettings getCitySetting(int id) {
    // TODO: implement getCitySetting
    throw UnimplementedError();
  }

  @override
  int getFavoriteCitySettings() {
    // TODO: implement getFavoriteCitySettings
    throw UnimplementedError();
  }

  @override
  String getNinjasApiKey() {
    // TODO: implement getNinjasApiKey
    throw UnimplementedError();
  }

  @override
  WeatherProvides getWeatherProviders(WeatherProvider id) {
    // TODO: implement getWeatherProviders
    throw UnimplementedError();
  }

  @override
  void saveAccuWeatherApiKey(String newApiKey) {
    // TODO: implement saveAccuWeatherApiKey
  }

  @override
  void saveOpenWeatherApiKey(String newApiKey) {
    // TODO: implement saveOpenWeatherApiKey
  }

  @override
  void setFavoriteCitySettings(int id) {
    // TODO: implement setFavoriteCitySettings
  }

}