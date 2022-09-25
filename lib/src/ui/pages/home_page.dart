import 'package:flutter/material.dart';
import 'package:weather_app/src/dto/openweather/current/request/impl/current_weather_request_dto.dart';
import 'package:weather_app/src/dto/openweather/current/request/impl/hourly_weather_request.dart';
import 'package:weather_app/src/models/current_weather_model.dart';
import 'package:weather_app/src/models/daily_weather_model.dart';
import 'package:weather_app/src/models/hourly_weather_model.dart';
import 'package:weather_app/src/restclient/openweather_rest_client.dart';
import 'package:weather_app/src/static/constants.dart';

import '../../services/mappers/mapper.dart';
import 'weather_information.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final OpenWeatherExecutor openWeatherExecutor = OpenWeatherExecutor();

  late WeatherInfoWidget accuWeatherInfoWidget = WeatherInfoWidget(false, "AccuWeather", CurrentWeatherModel.emptyModel(), List<HourlyWeatherModel>.empty(), List<DailyWeatherDetailModel>.empty());
  late WeatherInfoWidget openWeatherInfoWidget = WeatherInfoWidget(false, "OpenWeather", CurrentWeatherModel.emptyModel(), List<HourlyWeatherModel>.empty(), List<DailyWeatherDetailModel>.empty());
  late WeatherInfoWidget theWeatherWeatherInfoWidget = WeatherInfoWidget(false, "TheWeather", CurrentWeatherModel.emptyModel(), List<HourlyWeatherModel>.empty(), List<DailyWeatherDetailModel>.empty());

  void sendRequest(BuildContext context) async {
    setState(
      ()=> {
        openWeatherExecutor.getCurrentWeatherInfo(
          CurrentWeatherOpenWeatherRequestDto( // TODO bruuh
            latitude: 48.5161,
            longitude: 32.2581,
            appId: "c654ce747dc9f2f105fe0eeb463136b9",
            lang: "ua"))
          .then((currentWeatherResponse) => Mapper.mapCurrentWeatherModel(currentWeatherResponse))
          .then((currentWeatherModel) =>
            openWeatherExecutor.getHourlyWeatherInfo(
              HourlyWeatherOpenWeatherRequestDto(
                  latitude: 48.5161,
                  longitude: 32.2581,
                  appId: "c654ce747dc9f2f105fe0eeb463136b9"))
              .then((hourlyWeatherResponse)=> Mapper.mapHourlyWeatherModel(hourlyWeatherResponse))
              .then((listHourlyWeatherModel)=> openWeatherInfoWidget = WeatherInfoWidget(
                true,
                "OpenWeather",
                currentWeatherModel,
                listHourlyWeatherModel,
                List<DailyWeatherDetailModel>.empty())))
      });
  }

  void sendRequestMock(BuildContext context) async {
    var listHourly = [
      HourlyWeatherModel(16.3, DateTime.now().add(const Duration(hours: 1)), 57, "non"),
      HourlyWeatherModel(16.3, DateTime.now().add(const Duration(hours: 2)), 57, "non"),
      HourlyWeatherModel(16.3, DateTime.now().add(const Duration(hours: 3)), 57, "non"),
      HourlyWeatherModel(16.3, DateTime.now().add(const Duration(hours: 4)), 57, "non"),
      HourlyWeatherModel(16.3, DateTime.now().add(const Duration(hours: 4)), 57, "non"),
      HourlyWeatherModel(16.3, DateTime.now().add(const Duration(hours: 4)), 57, "non"),
      HourlyWeatherModel(16.3, DateTime.now().add(const Duration(hours: 4)), 57, "non"),
      HourlyWeatherModel(16.3, DateTime.now().add(const Duration(hours: 4)), 57, "non"),
      HourlyWeatherModel(16.3, DateTime.now().add(const Duration(hours: 5)), 57, "non")];

    var dailyModel = DailyWeatherModel(16.4, 19, 12, "description", 12, 10, DateTime.now(), DateTime.now(), 1, 13.2, 1, "iconResource");

    var listDaily = [
      DailyWeatherDetailModel(dailyModel, dailyModel),
      DailyWeatherDetailModel(dailyModel, dailyModel),
      DailyWeatherDetailModel(dailyModel, dailyModel),
      DailyWeatherDetailModel(dailyModel, dailyModel),
      DailyWeatherDetailModel(dailyModel, dailyModel),
      DailyWeatherDetailModel(dailyModel, dailyModel),
      DailyWeatherDetailModel(dailyModel, dailyModel),
      DailyWeatherDetailModel(dailyModel, dailyModel),
      DailyWeatherDetailModel(dailyModel, dailyModel),
      DailyWeatherDetailModel(dailyModel, dailyModel),
      DailyWeatherDetailModel(dailyModel, dailyModel),

    ];

    setState(
        ()=> {
          openWeatherInfoWidget = WeatherInfoWidget(
          true,
          "OpenWeather",
          CurrentWeatherModel(
            "Харків",
            "П`ятниця",
            "asd",
            "Вересень",
            9,
            17.1,
            18.3,
            14.5,
            17.3,
            "non",
            DateTime.now()),
          listHourly,
          listDaily)
        }
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                sendRequest(context);
              },
              iconSize: ConstantUI.weatherIconSize,
              icon: const Icon(Icons.abc_rounded),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0
        ),
        body:
          PageView(
            children: [
              openWeatherInfoWidget,
              accuWeatherInfoWidget,
              theWeatherWeatherInfoWidget,
            ],
          ),
    );
  }

}
