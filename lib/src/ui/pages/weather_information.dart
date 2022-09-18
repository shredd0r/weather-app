import 'package:flutter/material.dart';
import 'package:weather_app/src/models/current_weather_model.dart';
import 'package:weather_app/src/models/daily_weather_model.dart';
import 'package:weather_app/src/models/hourly_weather_model.dart';
import 'package:weather_app/src/ui/widgets/weather/current/current_weather_widget.dart';
import 'package:weather_app/src/ui/widgets/weather/daily/daily_weather_widget.dart';
import 'package:weather_app/src/ui/widgets/weather/hourly/hourly_weather_widget.dart';

class WeatherInfoWidget extends StatelessWidget {
  final bool _isVisible;
  final String _providerName;
  final CurrentWeatherModel _currentWeatherModel;
  final List<HourlyWeatherModel> _listHourlyWeatherModel;
  final List<DailyWeatherDetailModel> _listDailyWeatherDetailModel;

  const WeatherInfoWidget(
      this._isVisible,
      this._providerName,
      this._currentWeatherModel,
      this._listHourlyWeatherModel,
      this._listDailyWeatherDetailModel,
      {Key? key}) : super(key: key);

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
                Expanded(
                  child: Visibility(
                      visible: _isVisible,
                      replacement: const Center(child: CircularProgressIndicator()),
                      child: ListView(
                        children: [
                          const SizedBox(height: 25),
                          CurrentWeatherWidget(_currentWeatherModel),
                          const SizedBox(height: 15),
                          HourlyWeatherWidget(_listHourlyWeatherModel),
                          const SizedBox(height: 15),
                          DailyWeatherWidget(_listDailyWeatherDetailModel),
                          const SizedBox(height: 25),
                        ],
                      )
                  ),
                )
            ]  // const
        ),
    );
  }
}