import 'dart:io';

import 'package:flutter/material.dart';
import 'package:weather_app/models/current_weather_model.dart';
import 'package:weather_app/models/daily_weather_model.dart';
import 'package:weather_app/models/hourly_weather_model.dart';
import 'package:weather_app/models/openweather/current/request/current_weather_request_model.dart';
import 'package:weather_app/models/openweather/current/response/current_weather_response_model.dart';
import 'package:weather_app/restclient/openweather_rest_client.dart';

import 'weather_information.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late CurrentWeatherOpenWeatherResponseModel response;

  @override
  void initState() {
    super.initState();
  }

  void sendRequest(BuildContext context) {
    OpenWeatherExecutor()
        .getCurrentWeatherInfo(
          CurrentWeatherOpenWeatherRequestModel(
            latitude: 48.5161,
            longitude: 32.2581,
            appId: "c654ce747dc9f2f105fe0eeb463136b9"))

        .then(
            (value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.cityName))));
  }

  @override
  Widget build(BuildContext context) {

    var currentWeather = CurrentWeatherModel(
        "Kharkiv",
        "Thursday",
        "Sunless",
        "Jule",
        18,
        16.5,
        14,
        25,
        17,
        DateTime.now());

    var dailyInfo = DailyWeatherModel(
        24.3,
        "some description for daily weather",
        20,
        5,
        DateTime.now(),
        DateTime.now(),
        0.4,
        10);

    List<HourlyWeatherModel> listHourlyWeatherModel = [
      HourlyWeatherModel(25.3, DateTime(2022, 1, 1, 10, 00), 10),
      HourlyWeatherModel(22.3, DateTime(2022, 1, 1, 11, 00), 0),
      HourlyWeatherModel(26.3, DateTime(2022, 1, 1, 12, 00), 25),
      HourlyWeatherModel(21.3, DateTime(2022, 1, 1, 13, 00), 30),
      HourlyWeatherModel(28.3, DateTime(2022, 1, 1, 14, 00), 45),
    ];

    List<DailyWeatherInfoModel> listDailyWeatherInfoModel = [
      DailyWeatherInfoModel(dailyInfo, dailyInfo),
      DailyWeatherInfoModel(dailyInfo, dailyInfo),
      DailyWeatherInfoModel(dailyInfo, dailyInfo),
      DailyWeatherInfoModel(dailyInfo, dailyInfo),
      DailyWeatherInfoModel(dailyInfo, dailyInfo),
      DailyWeatherInfoModel(dailyInfo, dailyInfo),
      DailyWeatherInfoModel(dailyInfo, dailyInfo),
    ];

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
        body: Visibility(
          visible: false,
          replacement: const Center(
              child: CircularProgressIndicator()
          ),
          child: PageView(
            children: [
              WeatherInfoWidget("AccuWeather", currentWeather, listHourlyWeatherModel, listDailyWeatherInfoModel),
              WeatherInfoWidget("OpenWeather", currentWeather, listHourlyWeatherModel, listDailyWeatherInfoModel),
              WeatherInfoWidget("TheWeather", currentWeather, listHourlyWeatherModel, listDailyWeatherInfoModel)
            ],
          ),
        )
    );
  }

}
