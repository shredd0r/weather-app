import 'package:flutter/material.dart';
import 'package:weather_app/src/ui/factory/padding_for_list_item_factory.dart';
import 'package:weather_app/src/ui/widgets/border_container_widget.dart';

import '../../models/hourly_weather_model.dart';

class HourlyWeatherWidget extends StatelessWidget {

  HourlyWeatherWidget(
      this._listHourlyWeatherModel,
      {Key? key}) : super(key: key);

  List<HourlyWeatherModel> _listHourlyWeatherModel;

  @override
  Widget build(BuildContext context) {
    List<HourlyWeatherInfoWidget> hourlyWeatherInfoWidgetList = _listHourlyWeatherModel
        .map((model) => HourlyWeatherInfoWidget.byHourlyWeatherModel(model)).toList();

    return Center(
      child: BorderContainerWidget(   // TODO change to Expanded
        height: 150,
        width: 1000,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: hourlyWeatherInfoWidgetList.length,
          itemBuilder: ((context, index) {
            return PaddingForListItemFactory.getWidgetWithPadding(hourlyWeatherInfoWidgetList[index], hourlyWeatherInfoWidgetList, 11);
          }),
        )
      )
    );
  }
}


class HourlyWeatherInfoWidget extends StatelessWidget {

  late final int hour;
  late final int minute;
  late final double temperature;
  late final double probabilityOfPrecipitation;

  HourlyWeatherInfoWidget(this.hour, this.minute, this.temperature, this.probabilityOfPrecipitation, {Key? key}) : super(key: key);

  HourlyWeatherInfoWidget.byHourlyWeatherModel(HourlyWeatherModel hourlyWeatherModel, {Key? key}) : super(key: key) {
    hour = hourlyWeatherModel.time.hour;
    minute = hourlyWeatherModel.time.minute;
    temperature = hourlyWeatherModel.temperature;
    probabilityOfPrecipitation = hourlyWeatherModel.probabilityOfPrecipitation;
  }

  @override
  Widget build(BuildContext context) {
    return
      Column(
      children: [
        Text(
          "$hour:$minute",
          style: const TextStyle(fontSize: 20),
        ),
        IconButton(
            onPressed: () {},
            iconSize: 36,
            icon: const Icon(Icons.ac_unit_sharp)
        ),
        Text(
            "$temperature°",
            style: const TextStyle(fontSize: 18)
        ),
        Text(
            "$probabilityOfPrecipitation%"
        )
        ],
    );
  }

}