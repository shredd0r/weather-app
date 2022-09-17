import 'package:flutter/material.dart';
import 'package:weather_app/src/services/mappers/mapper.dart';
import 'package:weather_app/src/ui/widgets/common/border_container_widget.dart';
import 'package:weather_app/src/ui/widgets/common/column_with_separator.dart';
import 'package:weather_app/src/ui/widgets/common/common_separator.dart';

import '../../../models/daily_weather_model.dart';

class DailyWeatherWidget extends StatefulWidget {

  late List<_DailyItemInfoWeatherWidget> _listDailyItemInfoWeatherWidget;


  DailyWeatherWidget(List<DailyWeatherDetailModel> listDailyWeatherDetailModel, {Key? key}) : super(key: key) {
    _listDailyItemInfoWeatherWidget = listDailyWeatherDetailModel
        .map((model) => _DailyItemInfoWeatherWidget(model, false))
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
            .map((dailyWidget) => _DailyItemInfoWeatherWidget.likeness(dailyWidget, false))
            .toList(),

        widget._listDailyItemInfoWeatherWidget[index] =
            _DailyItemInfoWeatherWidget.likeness(infoWidgetForChange, !infoWidgetForChange.isExpanded)
      }
    );
  }
}

class _DailyItemInfoWeatherWidget extends StatefulWidget {

  late bool isExpanded;
  late DailyWeatherItemModel dailyWeatherItemModel;
  late DailyWeatherDetailModel dailyWeatherDetailModel;

  _DailyItemInfoWeatherWidget(this.dailyWeatherDetailModel, this.isExpanded) {
    dailyWeatherItemModel = Mapper.mapDailyWeatherItemModel(dailyWeatherDetailModel);
  }

  _DailyItemInfoWeatherWidget.likeness(_DailyItemInfoWeatherWidget likeWidget, this.isExpanded) {
    dailyWeatherItemModel = likeWidget.dailyWeatherItemModel;
    dailyWeatherDetailModel = likeWidget.dailyWeatherDetailModel;
  }

  @override
  State<StatefulWidget> createState() => _DailyItemInfoWeatherState();
}

class _DailyItemInfoWeatherState extends State<_DailyItemInfoWeatherWidget> {

  @override
  Widget build(BuildContext context) {
    return widget.isExpanded ?
      _DailyDetailInfoWeatherWidget(widget.dailyWeatherDetailModel) :
      _DailyInfoWeatherWidget(widget.dailyWeatherItemModel);
  }

}


class _DailyInfoWeatherWidget extends StatelessWidget {

  final DailyWeatherItemModel _dailyWeatherItemModel;

  const _DailyInfoWeatherWidget(this._dailyWeatherItemModel);

  @override
  Widget build(BuildContext context) {
    const double iconSize = 28.0;
    String hi = "Monday";

    return Table(
      columnWidths: const <int, TableColumnWidth> {
        0: FlexColumnWidth()
      },
      defaultColumnWidth: const IntrinsicColumnWidth(),
      children: [
        TableRow(
          children: [
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Text(hi, style: const TextStyle(fontSize: 18))
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Text(
                    "${_dailyWeatherItemModel.probabilityOfPrecipitation}%",
                    style: const TextStyle(fontSize: 16)
                ),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Row(
              children: const [
                Icon(
                  Icons.ac_unit,
                  size: iconSize),
                SizedBox(width: 2),
                Icon(
                  Icons.ac_unit,
                  size: iconSize),
                ],
              )
            ),
            TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Text("${_dailyWeatherItemModel.maxTemperature}° / ${_dailyWeatherItemModel.minTemperature}°",
                    style: const TextStyle(fontSize: 16)),
                ),
              )
            ),
            const TableCell(child: Icon(Icons.add))
          ]
        )
      ]
    );
  }
}

class _DailyDetailInfoWeatherWidget extends StatelessWidget {

  final DailyWeatherDetailModel _dailyWeatherDetailModel;

  const _DailyDetailInfoWeatherWidget(this._dailyWeatherDetailModel);

  @override
  Widget build(BuildContext context) {
    var listWidget = [
      buildDailyWeatherWidget(_dailyWeatherDetailModel.day),
      buildDailyWeatherWidget(_dailyWeatherDetailModel.night)];
    return BorderContainerWidget(
      outerPadding: 0,
      child: ColumnWithSeparator(
        itemCount: listWidget.length,
        separator: const SeparatorWidget(),
        itemBuilder: ((context, index) { return listWidget[index]; }),
      )
    );
  }

  Widget buildDailyWeatherWidget(DailyWeatherModel model) {
    return Column(
      children: [
        Text(model.description)
      ],
    );
  }

}