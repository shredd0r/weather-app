
import 'package:flutter/material.dart';
import 'package:weather_app/src/models/current_weather_model.dart';
import 'package:weather_app/src/ui/widgets/border_container_widget.dart';

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
              children: <TableRow> [
                TableRow(
                  children: [
                    TableCell(
                      child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(_currentWeatherModel.cityName, style: const TextStyle(fontSize: 28)),
                            ),
                            const SizedBox(height: 0),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("${_currentWeatherModel.dayOfWeek}, ${_currentWeatherModel.day} ${_currentWeatherModel.month}", style: const TextStyle(fontSize: 14)),
                            ),
                            const SizedBox(height: 7),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    iconSize: 36,
                                    icon: const Icon(Icons.ac_unit_sharp)
                                ),
                                Text("${_currentWeatherModel.currentTemperature}°", style: const TextStyle(fontSize: 36))
                              ],
                            )
                          ])
                    ),
                    Column(),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Text("temp", style: TextStyle(fontSize: 16)),
                          ),
                          const SizedBox(height: 3),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text("${_currentWeatherModel.maxTemperature}°/${_currentWeatherModel.minTemperature}°", style: const TextStyle(fontSize: 16)),
                          ),
                          const SizedBox(height: 3),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text("Feels like ${_currentWeatherModel.fillLikeTemperature}°", style: const TextStyle(fontSize: 16)),
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
              "Обновленов в: ${_currentWeatherModel.lastUpdate}",
              style: const TextStyle(
                  color: Colors.black38,
                  fontSize: 12),
            ),
          ],
        ),
    );
  }

}