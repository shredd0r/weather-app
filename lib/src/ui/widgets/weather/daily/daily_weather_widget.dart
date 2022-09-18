import 'package:flutter/material.dart';
import 'package:weather_app/src/ui/widgets/common/border_container_widget.dart';
import 'package:weather_app/src/ui/widgets/common/column_with_separator.dart';
import 'package:weather_app/src/ui/widgets/common/common_separator.dart';
import 'package:weather_app/src/ui/widgets/weather/daily/daily_weather_panel_widget.dart';

import '../../../../models/daily_weather_model.dart';

class DailyWeatherWidget extends StatefulWidget {

  late List<DailyItemInfoWeatherWidget> _listDailyItemInfoWeatherWidget;


  DailyWeatherWidget(List<DailyWeatherDetailModel> listDailyWeatherDetailModel, {Key? key}) : super(key: key) {
    _listDailyItemInfoWeatherWidget = listDailyWeatherDetailModel
        .map((model) => DailyItemInfoWeatherWidget(model, false))
        .toList();
  }
    @override
  State<StatefulWidget> createState() => _DailyWeatherState();
}

class _DailyWeatherState extends State<DailyWeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BorderContainerWidget(
        innerPadding: 15,
        outerPadding: 15,
        child: ColumnWithSeparator(
          itemCount: widget._listDailyItemInfoWeatherWidget.length,
          separator: const SeparatorWidget(),
          itemBuilder: ((context, index) { return
            GestureDetector(
              onTap: () { changeInfoAboutDailyWeather(index); },
              child: widget._listDailyItemInfoWeatherWidget[index]
            );
          })
        )
      )
    );
  }

  void changeInfoAboutDailyWeather(int index) {
    var infoWidgetForChange = widget._listDailyItemInfoWeatherWidget[index];
    setState(
      ()=> {
        widget._listDailyItemInfoWeatherWidget = widget._listDailyItemInfoWeatherWidget
            .map((dailyWidget) => DailyItemInfoWeatherWidget.likeness(dailyWidget, false))
            .toList(),

        widget._listDailyItemInfoWeatherWidget[index] =
            DailyItemInfoWeatherWidget.likeness(infoWidgetForChange, !infoWidgetForChange.isExpanded)
      }
    );
  }
}