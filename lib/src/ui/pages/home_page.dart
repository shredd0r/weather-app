import 'package:flutter/material.dart';
import 'package:weather_app/src/dto/openweather/current/request/current_weather_request_dto.dart';
import 'package:weather_app/src/models/current_weather_model.dart';
import 'package:weather_app/src/models/daily_weather_model.dart';
import 'package:weather_app/src/models/hourly_weather_model.dart';
import 'package:weather_app/src/restclient/openweather_rest_client.dart';

import 'weather_information.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late WeatherInfoWidget accuWeatherInfoWidget = WeatherInfoWidget(false, "AccuWeather", CurrentWeatherModel.emptyModel(), List<HourlyWeatherModel>.empty(), List<DailyWeatherInfoModel>.empty());
  late WeatherInfoWidget openWeatherInfoWidget = WeatherInfoWidget(false, "OpenWeather", CurrentWeatherModel.emptyModel(), List<HourlyWeatherModel>.empty(), List<DailyWeatherInfoModel>.empty());
  late WeatherInfoWidget theWeatherWeatherInfoWidget = WeatherInfoWidget(false, "TheWeather", CurrentWeatherModel.emptyModel(), List<HourlyWeatherModel>.empty(), List<DailyWeatherInfoModel>.empty());

  @override
  void initState() {
    super.initState();
  }

  void sendRequest(BuildContext context) async {
    setState(
            ()=> OpenWeatherExecutor()
                .getCurrentWeatherInfo(
                CurrentWeatherOpenWeatherRequestDto(
                    latitude: 48.5161,
                    longitude: 32.2581,
                    appId: "c654ce747dc9f2f105fe0eeb463136b9"))
                .then((value) => openWeatherInfoWidget.currentWeatherModel =
                CurrentWeatherModel(         //TODO fix that shit
                    value.cityName,
                     "null",
                     "null",
                    DateTime.now().month.toString(),
                    DateTime.now().day,
                    value.mainInfoModel!.temperature!.sign,
                    value.mainInfoModel!.minTemperature!.sign,
                    value.mainInfoModel!.maxTemperature!.sign,
                    value.mainInfoModel!.feelsLike!.sign,
                    DateTime.now()))
                .then((value) => openWeatherInfoWidget.isVisible = true)
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
              iconSize: 36.0,
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
