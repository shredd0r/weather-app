import 'package:flutter/material.dart';
import 'package:weather_app/src/ui/widgets/current_weather_widget.dart';

import 'package:weather_app/src/models/current_weather_model.dart';
import 'package:weather_app/src/models/daily_weather_model.dart';
import 'package:weather_app/src/models/hourly_weather_model.dart';
import 'package:weather_app/src/ui/widgets/daily_weather_widget.dart';
import 'package:weather_app/src/ui/widgets/hourly_weather_widget.dart';

class WeatherInfoWidget extends StatelessWidget {
  const WeatherInfoWidget(
      this._providerName,
      this._currentWeatherModel,
      this._listHourlyWeatherModel,
      this._listDailyWeatherInfoModel,
      {Key? key}) : super(key: key);
  final String _providerName;
  final CurrentWeatherModel _currentWeatherModel;
  final List<HourlyWeatherModel> _listHourlyWeatherModel;
  final List<DailyWeatherInfoModel> _listDailyWeatherInfoModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Center(
              child: Text(
                  _providerName,
                  style: const TextStyle(fontSize: 30))
          ),
          const SizedBox(height: 25),
          CurrentWeatherWidget(_currentWeatherModel),
          const SizedBox(height: 15),
          HourlyWeatherWidget(_listHourlyWeatherModel),
          const SizedBox(height: 15),
          DailyWeatherWidget(_listDailyWeatherInfoModel)
          // const
        ]
      ),
    );
  }

}