import 'package:sqflite/sqflite.dart';
import 'package:weather_app/src/entity/weather_settings.dart';
import 'package:weather_app/src/services/repositories/base/base_weather_setting_repository.dart';

class SqlLiteWeatherSettingRepository implements BaseWeatherSettingsRepository {

  late Database _database;

  SqlLiteWeatherSettingRepository(this._database);

  @override
  Future<WeatherSettingsEntity> findByCity(String city) {
    // TODO: implement findByCity
    throw UnimplementedError();
  }

  @override
  Future<WeatherSettingsEntity> findById(int id) async {
    // TODO: implement findById
    var temp = await _database.rawQuery('');

    throw UnimplementedError();
  }

  @override
  Future<List<WeatherSettingsEntity>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

}