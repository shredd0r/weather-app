import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_app/src/entity/api_keys.dart';
import 'package:weather_app/src/entity/favorite_settings.dart';
import 'package:weather_app/src/static/constants.dart';
import 'package:weather_app/src/static/apikey_enum.dart';
import 'package:weather_app/src/entity/weather_settings.dart';
import 'package:weather_app/src/static/entity_constants.dart';
import 'package:weather_app/src/services/repositories/base/configuration_repository.dart';

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
        _createTables(dataBase, version);
        _insertDataInEntity(dataBase, version);
    });

    FlutterLogs.logInfo("ConfigurationSqlLiteRepository", "load", "db path: $dbPath, db version: ${await dataBase.getVersion()}");
  }

  @override
  Future<List<CitySettings>> getAllCitySettings() async {
    var response = await dataBase.query(CitySettingsStatic.entityName);

    FlutterLogs.logInfo("ConfigurationSqlLiteRepository", "getAllCitySettings", "response: $response");
    return response.map((citySettingsJson) => CitySettings.fromJson(citySettingsJson)).toList();
  }

  @override
  Future<CitySettings> getCitySetting(int id) async {
    var response = await dataBase.query(
      CitySettingsStatic.entityName,
      where: "${CitySettingsStatic.id} = $id}");

    FlutterLogs.logInfo("ConfigurationSqlLiteRepository", "getCitySetting", "response: $response");


    return CitySettings.fromJson(_getFirstElementFromResponse(response));
  }

  @override
  Future<FavoriteCitySettings> getFavoriteCitySettings() async {
    var response = await dataBase.query(FavoriteCitySettingStatic.entityName, limit: 1);

    FlutterLogs.logInfo("ConfigurationSqlLiteRepository", "getFavoriteCitySettings", "response: $response");


    return FavoriteCitySettings.fromJson(_getFirstElementFromResponse(response));
  }

  @override
  void setFavoriteCitySettings(int id) {
    // TODO: implement setFavoriteCitySettings
  }

  @override
  Future<ApiKeys> getApiKeyBy(ApiKey apiKey) {
    throw UnimplementedError();
  }

  @override
  void saveApiKey(ApiKeys newApiKeys) {
    dataBase.insert(ApiKeysStatics.entityName, newApiKeys.toJson());
  }

  @override
  void updateCityIdInCitySettings(int id, int newCityId) {
    // TODO: implement updateCityIdInCitySettings
  }

  void _createTables(Database database, int version) {
    if (version == 1) {
      database.execute(
          '''create table ${ApiKeysStatics.entityName}(
        ${ApiKeysStatics.id} INTEGER PRIMARY KEY,
        ${ApiKeysStatics.apiKey} TEXT,
        ${ApiKeysStatics.serviceName} TEXT)'''
      );
      database.execute(
          '''create table ${ProviderInfosStatic.entityName}(
        ${ProviderInfosStatic.id} INTEGER PRIMARY KEY, 
        ${ProviderInfosStatic.name} TEXT,
        ${ProviderInfosStatic.apiKey} INTEGER,
        ${ProviderInfosStatic.countCallApiPerDay} INTEGER)
      ''');
      database.execute(
          '''create table ${FavoriteCitySettingStatic.entityName}(
        ${FavoriteCitySettingStatic.id} INTEGER PRIMARY KEY,
        ${FavoriteCitySettingStatic.citySettings} INTEGER)
      ''');
      database.execute(
          '''create table ${CitySettingsStatic.entityName}(
        ${CitySettingsStatic.id} INTEGER PRIMARY KEY,
        ${CitySettingsStatic.city} TEXT,
        ${CitySettingsStatic.cityId} TEXT,
        ${CitySettingsStatic.latitude} DOUBLE,
        ${CitySettingsStatic.longitude} DOUBLE)
      '''
      );
    }
  }

  void _insertDataInEntity(Database database, int version) {
    if (version == 1) {
      dataBase.insert(ApiKeysStatics.entityName, {
        ApiKeysStatics.id : 1,
        ApiKeysStatics.apiKey : Constant.defaultNinjaKey,
        ApiKeysStatics.serviceName : "NinjasService"
      });
    }
  }

  Map<String, dynamic> _getFirstElementFromResponse(List<Map<String, dynamic>> response) {
    return response.isNotEmpty ?
        response.first :
        Map<String, dynamic>();
  }
}