import 'package:flutter/material.dart';
import 'package:weather_app/src/ui/widgets/current_weather_widget.dart';

import 'package:weather_app/src/models/current_weather_model.dart';
import 'package:weather_app/src/models/daily_weather_model.dart';
import 'package:weather_app/src/models/hourly_weather_model.dart';
import 'package:weather_app/src/ui/widgets/daily_weather_widget.dart';
import 'package:weather_app/src/ui/widgets/hourly_weather_widget.dart';

class WeatherInfoWidget extends StatelessWidget {
  WeatherInfoWidget(
      this._isVisible,
      this._providerName,
      this._currentWeatherModel,
      this._listHourlyWeatherModel,
      this._listDailyWeatherInfoModel,
      {Key? key}) : super(key: key);
  late bool _isVisible;
  late final String _providerName;
  late CurrentWeatherModel _currentWeatherModel;
  late List<HourlyWeatherModel> _listHourlyWeatherModel;
  late List<DailyWeatherInfoModel> _listDailyWeatherInfoModel;

  set isVisible(bool isVisible) => _isVisible = isVisible;
  set currentWeatherModel(CurrentWeatherModel currentWeatherModel) => _currentWeatherModel = currentWeatherModel;
  set listHourlyWeatherModel(List<HourlyWeatherModel> listHourlyWeatherModel) => _listHourlyWeatherModel = listHourlyWeatherModel;
  set listDailyWeatherInfoModel(List<DailyWeatherInfoModel> listDailyWeatherInfoModel) => _listDailyWeatherInfoModel = listDailyWeatherInfoModel;

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
                Visibility(
                    visible: _isVisible,
                    replacement: const Center(child: CircularProgressIndicator()),
                    child: Column(
                      children: [
                        const SizedBox(height: 25),
                        CurrentWeatherWidget(_currentWeatherModel),
                        const SizedBox(height: 15),
                        HourlyWeatherWidget(_listHourlyWeatherModel),
                        const SizedBox(height: 15),
                        DailyWeatherWidget(_listDailyWeatherInfoModel)
                      ],
                    )
                )
            ]  // const
        ),
    );
  }
}