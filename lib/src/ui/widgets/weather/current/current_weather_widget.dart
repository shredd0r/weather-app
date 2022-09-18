
import 'package:flutter/material.dart';
import 'package:weather_app/src/models/current_weather_model.dart';
import 'package:weather_app/src/static/constants.dart';
import 'package:weather_app/src/ui/widgets/common/border_container_widget.dart';
import 'package:weather_app/src/ui/widgets/common/icon_text_widget.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget(this._currentWeatherModel, {Key? key}) : super(key: key);

  final CurrentWeatherModel _currentWeatherModel;

  @override
  Widget build(BuildContext context) {
    return BorderContainerWidget(
      child: Column(
        children: [
          Table(
            columnWidths: const <int, TableColumnWidth> {
              0: IntrinsicColumnWidth(),
              1: FlexColumnWidth(),
              2: IntrinsicColumnWidth()
            },
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(_currentWeatherModel.cityName, style: const TextStyle(fontSize: 28)),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              "${_currentWeatherModel.dayOfWeek}, ${_currentWeatherModel.month} ${_currentWeatherModel.day}",
                              style: const TextStyle(fontSize: ConstantUI.textDayOfWeekFontSize)),
                        )
                      ]
                    )
                  ),
                  const TableCell(child: SizedBox()),
                  const TableCell(child: SizedBox())
                ]
              ),
              TableRow(
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: IconText("${_currentWeatherModel.currentTemperature}°",
                      Icons.ac_unit,
                      size: 36)
                  ),
                  Column(),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text("temp", style: TextStyle(fontSize: ConstantUI.textPercentAndTemperatureFontSize)),
                        ),
                        const SizedBox(height: 3),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text("${_currentWeatherModel.maxTemperature}°/${_currentWeatherModel.minTemperature}°",
                              style: const TextStyle(fontSize: ConstantUI.textPercentAndTemperatureFontSize)),
                        ),
                        const SizedBox(height: 3),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text("Feels like ${_currentWeatherModel.fillLikeTemperature}°",
                              style: const TextStyle(fontSize: ConstantUI.textPercentAndTemperatureFontSize)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "Обновлено в: ${_currentWeatherModel.lastUpdate}",
            style: const TextStyle(
              color: Colors.black38,
              fontSize: 12),
          ),
        ],
      ),
    );
  }
}