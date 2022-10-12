import 'package:flutter_logs/flutter_logs.dart';
import 'package:http/http.dart';
import 'package:weather_app/src/dto/accuweather/request/weather_request_dto.dart';
import 'package:weather_app/src/dto/accuweather/response/daily_weather_response_dto.dart';
import 'package:weather_app/src/utils/QueryParametersHelper.dart';

class AccuWeatherExecutor {
  final Client _client = Client();
  final String _path = "http://dataservice.accuweather.com/forecasts/v1/";

  AccuWeatherExecutor();

  Future<DailyWeatherAccuWeatherResponseDto> getCurrentWeatherInfo(WeatherAccuWeatherRequestDto requestDto, String cityId) async {
    var uri = Uri.parse(_path);
    uri.replace(
      path: "${uri.path}daily/1day/$cityId",
      queryParameters: QueryParametersHelper.map(requestDto.toJson()));

    FlutterLogs.logInfo("weather-app", "accuweather-executor", "uri: ${uri.toString()}");

    Response response = await _client.get(uri);

    return null;
  }
}