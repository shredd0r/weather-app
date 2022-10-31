import 'package:weather_app/src/entity/api_keys.dart';
import 'package:weather_app/src/entity/weather_settings.dart';
import 'package:weather_app/src/static/apikey_enum.dart';

abstract class ConfigurationRepository {

  ConfigurationRepository() {
    load();
  }

  void load();

  Future<int> getFavoriteCitySettings();
  void setFavoriteCitySettings(int id);

  Future<ApiKeys> getApiKeyBy(ApiKey apiKey);
  void saveApiKey(ApiKeys newApiKeys);

  void updateCityIdInCitySettings(int id, int newCityId);
  Future<CitySettings> getCitySetting(int id);
  Future<List<CitySettings>> getAllCitySettings();

}