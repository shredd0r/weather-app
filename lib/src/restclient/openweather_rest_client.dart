import 'dart:convert';

import 'package:flutter_logs/flutter_logs.dart';
import 'package:http/http.dart';

import 'package:weather_app/src/dto/openweather/current/request/impl/current_weather_request_dto.dart';
import 'package:weather_app/src/dto/openweather/current/response/current_weather_response_dto.dart';

class OpenWeatherExecutor {

  final Client _client = Client();
  final String _path = "https://api.openweathermap.org/data/2.5/weather";

  OpenWeatherExecutor();

  Future<CurrentWeatherOpenWeatherResponseDto> getCurrentWeatherInfo(CurrentWeatherOpenWeatherRequestDto requestModel) async{
    FlutterLogs.logInfo("tag", "subTag", "start execute");
    var uri = Uri.parse(_path);
    uri = Uri(
        scheme: uri.scheme,
        host: uri.host,
        path: uri.path,
        queryParameters: requestModel.toJson());
    
    FlutterLogs.logInfo("weather-app", "openweather-executor", "uri: ${uri.toString()}");

    Response response;

    response = await _client.get(uri);

    if (response.statusCode == 200) {
      FlutterLogs.logInfo("weather-app", "openweather-executor", "status code: ${response.statusCode.toString()}");
      FlutterLogs.logInfo("weather-app", "openweather-executor", "body: ${response.body}");
      return CurrentWeatherOpenWeatherResponseDto.fromJson(jsonDecode(response.body));
    }

    throw "Http error: ${response.statusCode}, body: ${response.body}";
  }

  // Future<>
}