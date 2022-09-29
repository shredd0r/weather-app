
import 'package:weather_app/src/dto/openweather/response/current_weather_response_dto.dart';
import 'package:weather_app/src/dto/openweather/response/hourly_weather_response.dart';
import 'package:weather_app/src/dto/openweather/response/innermodelinresponse/hourly_info.dart';
import 'package:weather_app/src/models/current_weather_model.dart';
import 'package:weather_app/src/models/daily_weather_model.dart';
import 'package:weather_app/src/models/hourly_weather_model.dart';


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
      response.mainInfoModel!.temperature as double,
      response.mainInfoModel!.minTemperature as double,
      response.mainInfoModel!.maxTemperature as double,
      response.mainInfoModel!.feelsLike as double,
      response.weather[0].icon as String,
      datetimeNow);
  }

  static List<HourlyWeatherModel> mapHourlyWeatherModel(HourlyWeatherOpenWeatherResponseDto response) {
    return response.listHourlyInfo.map((hourlyInfo) => _mapHourlyWeatherModel(hourlyInfo)).toList();
  }

  static HourlyWeatherModel _mapHourlyWeatherModel(HourlyInfoDto hourlyInfoDto) {

    if (hourlyInfoDto.mainInfoDto == null) {
      throw NullThrownError();
    }

    return HourlyWeatherModel(
      hourlyInfoDto.mainInfoDto!.temperature as double,
      DateTime.fromMicrosecondsSinceEpoch(hourlyInfoDto.datetimeForecasted),
      hourlyInfoDto.probabilityOfPrecipitation,
      hourlyInfoDto.weatherInfoDtoList[0].icon as String);
  }

  static DailyWeatherItemModel mapDailyWeatherItemModel(DailyWeatherDetailModel dailyWeatherDetailModel) {
    return DailyWeatherItemModel(
      dailyWeatherDetailModel.day.dayOfWeek,
      dailyWeatherDetailModel.day.maxTemperature,
      dailyWeatherDetailModel.night.minTemperature,
      dailyWeatherDetailModel.day.iconResource,
      dailyWeatherDetailModel.night.iconResource,
      dailyWeatherDetailModel.day.rainfall);
  }
}