import 'package:flutter/material.dart';
import 'package:weather_app/src/models/hourly_weather_model.dart';
import 'package:weather_app/src/static/constants.dart';
import 'package:weather_app/src/ui/factory/padding_for_list_item_factory.dart';
import 'package:weather_app/src/ui/widgets/common/border_container_widget.dart';


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
      child: BorderContainerWidget(
        height: 160,
        width: 1000,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: hourlyWeatherInfoWidgetList.length,
          itemBuilder: ((context, index) {
            return PaddingForListItemFactory.getWidgetWithPadding(hourlyWeatherInfoWidgetList[index], hourlyWeatherInfoWidgetList, 12);
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
          // "$hour:$minute",
          "00:00",
          style: const TextStyle(fontSize: 20),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Icon(
              Icons.ac_unit_sharp,
              size: ConstantUI.weatherIconSize,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: ConstantUI.paddingSize),
          child: Text(
              "$temperature°",
              style: const TextStyle(fontSize: 20)
          ),
        ),
        Text(
            "$probabilityOfPrecipitation%",
            style: const TextStyle(fontSize: ConstantUI.textPercentAndTemperatureFontSize)
        )
        ],
    );
  }

}