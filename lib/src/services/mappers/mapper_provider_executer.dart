import 'package:weather_app/src/models/current_weather_model.dart';

import '../../dto/openweather/current/response/current_weather_response_dto.dart';

class Mapper {

  static CurrentWeatherModel mapCurrentWeatherModel(CurrentWeatherOpenWeatherResponseDto response) {
    var datetimeNow = DateTime.now();

    if (response.mainInfoModel == null) {
      throw NullThrownError();
    }

    return CurrentWeatherModel(
      response.cityName,
      datetimeNow.weekday.toString(),
      response.visibility.toString(),
      datetimeNow.month.toString(),
      datetimeNow.day,
        (response.mainInfoModel!.temperature as double),
        (response.mainInfoModel!.minTemperature as double),
        (response.mainInfoModel!.maxTemperature as double),
        (response.mainInfoModel!.feelsLike as double),
      datetimeNow);
  }
}