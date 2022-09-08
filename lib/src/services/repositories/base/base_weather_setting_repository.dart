import 'package:weather_app/src/entity/weather_settings.dart';
import 'package:weather_app/src/services/repositories/base/base_repository.dart';

abstract class BaseWeatherSettingsRepository implements BaseRepository<WeatherSettingsEntity> {

  Future<WeatherSettingsEntity> findByCity(String city);
}