import 'package:flutter/material.dart';
import '../../models/daily_weather_model.dart';

class DailyWeatherWidget extends StatelessWidget {
  const DailyWeatherWidget(this._listDailyWeatherInfoModel, {Key? key}) : super(key: key);

  final List<DailyWeatherInfoModel> _listDailyWeatherInfoModel;

  @override
  Widget build(BuildContext context) {

    return Center(
        child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: Colors.black
                ),
              ),
              child: Text("Hello")
            )
        )
    );
  }

}