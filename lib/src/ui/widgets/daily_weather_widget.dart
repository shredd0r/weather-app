import 'package:flutter/material.dart';
import 'package:weather_app/src/ui/widgets/border_container_widget.dart';
import '../../models/daily_weather_model.dart';

class DailyWeatherWidget extends StatelessWidget {
  const DailyWeatherWidget(this._listDailyWeatherInfoModel, {Key? key}) : super(key: key);

  final List<DailyWeatherInfoModel> _listDailyWeatherInfoModel;

  @override
  Widget build(BuildContext context) {

    return Center(
      child: BorderContainerWidget(
        height: 10000,
        width: 385,
        child: ListView.builder(
          itemCount: _listDailyWeatherInfoModel.length,
          itemBuilder: ((context, index) {
            return const Text("hello");
          })
        )
      )
    );
  }

}