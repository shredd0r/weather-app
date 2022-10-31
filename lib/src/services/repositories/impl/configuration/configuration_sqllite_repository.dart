import 'dart:io';

import 'package:flutter_logs/flutter_logs.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:weather_app/src/entity/api_keys.dart';
import 'package:weather_app/src/entity/weather_settings.dart';
import 'package:weather_app/src/services/repositories/base/configuration_repository.dart';
import 'package:weather_app/src/static/apikey_enum.dart';
import 'package:weather_app/src/static/constants.dart';
import 'package:weather_app/src/static/entity_constants.dart';

class ConfigurationSqlLiteRepository extends ConfigurationRepository {

  late Database dataBase;

  ConfigurationSqlLiteRepository() : super();

  @override
  void load() async {
    Directory directory = await getApplicationDocumentsDirectory();
    var dbPath = directory.path + "/" + Constant.dbName;
    dataBase = await openDatabase(dbPath,
      version: 1,
      onCreate: (Database dataBase, int version) {
        dataBase.execute(
          '''create table ${ProviderInfosStatic.entityName}(
            ${ProviderInfosStatic.id} INTEGER PRIMARY KEY, 
            ${ProviderInfosStatic.name} TEXT,
            ${ProviderInfosStatic.apiKey} TEXT,
            ${ProviderInfosStatic.countCallApiPerDay} INTEGER)
          ''');
        dataBase.execute(
          '''create table ${FavoriteCitySettingStatic.entityName}(
            ${FavoriteCitySettingStatic.id} INTEGER PRIMARY KEY)
          ''');
        dataBase.execute(
          '''create table ${CitySettingsStatic.entityName}(
            ${CitySettingsStatic.id} INTEGER PRIMARY KEY,
            ${CitySettingsStatic.city} TEXT,
            ${CitySettingsStatic.cityId} TEXT,
            ${CitySettingsStatic.latitude} DOUBLE,
            ${CitySettingsStatic.longitude} DOUBLE)
          '''
        );
    });

    FlutterLogs.logInfo("ConfigurationSqlLiteRepository", "load", "db path: $dbPath, db version: ${await dataBase.getVersion()}");
  }

  @override
  Future<List<CitySettings>> getAllCitySettings() {
    var response = dataBase.query(CitySettingsStatic.entityName);
    FlutterLogs.logInfo("ConfigurationSqlLiteRepository", "getAllCitySettings", "response: $response");

    throw UnimplementedError();
  }

  @override
  Future<CitySettings> getCitySetting(int id) {
    var response = dataBase.query(CitySettingsStatic.entityName,
        where: "${CitySettingsStatic.id} = $id}");

    FlutterLogs.logInfo("ConfigurationSqlLiteRepository", "getCitySetting", "response: $response");

    throw UnimplementedError();
  }

  @override
  Future<int> getFavoriteCitySettings() {
    var response = dataBase.query(FavoriteCitySettingStatic.entityName, limit: 1);

    FlutterLogs.logInfo("ConfigurationSqlLiteRepository", "getFavoriteCitySettings", "response: $response");


    throw UnimplementedError();
  }

  @override
  void setFavoriteCitySettings(int id) {
    // TODO: implement setFavoriteCitySettings
  }

  @override
  Future<ApiKeys> getApiKeyBy(ApiKey apiKey) {
    // TODO: implement getApiKeyBy
    throw UnimplementedError();
  }

  @override
  void saveApiKey(ApiKeys newApiKeys) {
    // TODO: implement saveApiKey
  }

  @override
  void updateCityIdInCitySettings(int id, int newCityId) {
    // TODO: implement updateCityIdInCitySettings
  }
}