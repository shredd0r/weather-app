import 'dart:convert';

import 'package:flutter_logs/flutter_logs.dart';
import 'package:weather_app/src/dto/accuweather/request/weather_request_dto.dart';
import 'package:weather_app/src/dto/accuweather/response/daily_weather_response_dto.dart';
import 'package:weather_app/src/restclient/base/base_rest_executor.dart';
import 'package:weather_app/src/utils/QueryParametersHelper.dart';

class AccuWeatherExecutor extends BaseRestExecutor {
  AccuWeatherExecutor() : super("http://dataservice.accuweather.com/forecasts/v1/", "AccuWeatherExecutor");

  Future<DailyWeatherAccuWeatherResponseDto> getCurrentWeatherInfo(WeatherAccuWeatherRequestDto requestDto, String cityId) async {
    return _getWeatherInfoBy(requestDto, cityId, "daily/1day");
  }

  Future<DailyWeatherAccuWeatherResponseDto> getHourlyWeatherInfo(WeatherAccuWeatherRequestDto requestDto, String cityId) async {
    return _getWeatherInfoBy(requestDto, cityId, "hourly/12hour");
  }

  Future<DailyWeatherAccuWeatherResponseDto> getDailyWeatherInfo(WeatherAccuWeatherRequestDto requestDto, String cityId) async {
    return _getWeatherInfoBy(requestDto, cityId, "daily/5day");
  }


  Future<DailyWeatherAccuWeatherResponseDto> _getWeatherInfoBy(WeatherAccuWeatherRequestDto requestDto, String cityId, String queryPath) async {
    var uri = Uri.parse(path);
    uri.replace(
        path: "${uri.path}$queryPath/$cityId",
        queryParameters: QueryParametersHelper.map(requestDto.toJson()));

    FlutterLogs.logInfo("weather-app", executorName, "uri: ${uri.toString()}");

    var response = await client.get(uri);

    return DailyWeatherAccuWeatherResponseDto
        .fromJson(jsonDecode(checkResponseStatusEndReturnResponseBody(response)));
  }
}