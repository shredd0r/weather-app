import 'dart:convert';

import 'package:flutter_logs/flutter_logs.dart';

import 'package:weather_app/src/dto/openweather/request/impl/current_weather_request_dto.dart';
import 'package:weather_app/src/dto/openweather/request/impl/hourly_weather_request.dart';
import 'package:weather_app/src/dto/openweather/response/current_weather_response_dto.dart';
import 'package:weather_app/src/dto/openweather/response/hourly_weather_response.dart';
import 'package:weather_app/src/restclient/base/base_rest_executor.dart';
import 'package:weather_app/src/utils/QueryParametersHelper.dart';

class OpenWeatherExecutor extends BaseRestExecutor{

  OpenWeatherExecutor() : super("https://api.openweathermap.org/data/2.5/", "OpenWeatherExecutor");

  Future<CurrentWeatherOpenWeatherResponseDto> getCurrentWeatherInfo(CurrentWeatherOpenWeatherRequestDto requestDto) async {
    var uri = Uri.parse(path);

    uri.replace(
        path: "${uri.path}weather",
        queryParameters: QueryParametersHelper.map(requestDto.toJson()));
    
    FlutterLogs.logInfo("weather-app", "openweather-executor", "uri: ${uri.toString()}");

    var response = await client.get(uri, headers: {'Content-Type': 'application/json'});

    return CurrentWeatherOpenWeatherResponseDto
        .fromJson(jsonDecode(checkResponseStatusEndReturnResponseBody(response)));
  }

  Future<HourlyWeatherOpenWeatherResponseDto> getDailyHourlyWeatherInfo(HourlyWeatherOpenWeatherRequestDto requestDto) async {
    var uri = Uri.parse(path);

    uri.replace(
        path: "${uri.path}forecast",
        queryParameters: QueryParametersHelper.map(requestDto.toJson()));

    FlutterLogs.logInfo("weather-app", "openweather-executor", "uri: ${uri.toString()}");

    var response = await client.get(uri, headers: {'Content-Type': 'application/json'});

    return HourlyWeatherOpenWeatherResponseDto
        .fromJson(jsonDecode(checkResponseStatusEndReturnResponseBody(response)));
  }
}