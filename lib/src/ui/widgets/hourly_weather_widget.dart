import 'package:flutter/material.dart';

import '../../models/hourly_weather_model.dart';

class HourlyWeatherWidget extends StatelessWidget {

  HourlyWeatherWidget(
      this._listHourlyWeatherModel,
      {Key? key}) : super(key: key);

  List<HourlyWeatherModel> _listHourlyWeatherModel;

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
          child: Table(
              columnWidths: _getMapTableColumnWidth(),
              children: <TableRow> [ TableRow(children: _getListWithWidget()) ]
          ),
        )
      )
    );
  }

  Map<int, TableColumnWidth> _getMapTableColumnWidth() {
    Map<int, TableColumnWidth> mapTableColumnWidth = <int, TableColumnWidth>{};
    var indexForMapTableColumnWidth = 0;

    for(int index = 0; index < _listHourlyWeatherModel.length - 1; index++) {
      mapTableColumnWidth.putIfAbsent(indexForMapTableColumnWidth, () => const IntrinsicColumnWidth());
      indexForMapTableColumnWidth++;
      mapTableColumnWidth.putIfAbsent(indexForMapTableColumnWidth, () => const FlexColumnWidth());
      indexForMapTableColumnWidth++;
    }
    mapTableColumnWidth.putIfAbsent(indexForMapTableColumnWidth, () => const IntrinsicColumnWidth());
    return mapTableColumnWidth;
  }

  List<Widget> _getListWithWidget() {
    List<Widget> listWidget = <Widget>[];

    for(int index = 0; index < _listHourlyWeatherModel.length - 1; index++) {
      listWidget.add(_addWidgetWithHourlyWeather(_listHourlyWeatherModel.elementAt(index)));
      listWidget.add(const SizedBox(height: 1));
    }

    listWidget.add(_addWidgetWithHourlyWeather(_listHourlyWeatherModel.last));
    return listWidget;
  }

  Widget _addWidgetWithHourlyWeather(HourlyWeatherModel hourlyWeatherModel) {
    return Column(
      children: [
        Text(
          "${hourlyWeatherModel.time.hour}:${hourlyWeatherModel.time.minute}",
          style: const TextStyle(fontSize: 20),
        ),
        IconButton(
            onPressed: () {},
            iconSize: 36,
            icon: const Icon(Icons.ac_unit_sharp)
        ),
        Text(
            "${hourlyWeatherModel.temperature}°",
            style: const TextStyle(fontSize: 18)
        ),
        Text(
            "${hourlyWeatherModel.fertilityOfSediments}%"
        )
      ],
    );
  }
}