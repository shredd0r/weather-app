import 'package:flutter/material.dart';
import 'package:weather_app/src/models/daily_weather_model.dart';
import 'package:weather_app/src/services/mappers/mapper.dart';
import 'package:weather_app/src/static/constants.dart';
import 'package:weather_app/src/ui/widgets/common/border_container_widget.dart';
import 'package:weather_app/src/ui/widgets/common/column_with_separator.dart';
import 'package:weather_app/src/ui/widgets/common/common_separator.dart';
import 'package:weather_app/src/ui/widgets/common/icon_text_widget.dart';

class DailyItemInfoWeatherWidget extends StatefulWidget {

  late bool isExpanded;
  late DailyWeatherItemModel dailyWeatherItemModel;
  late DailyWeatherDetailModel dailyWeatherDetailModel;

  DailyItemInfoWeatherWidget(this.dailyWeatherDetailModel, this.isExpanded, {Key? key}) : super(key: key) {
    dailyWeatherItemModel = Mapper.mapDailyWeatherItemModel(dailyWeatherDetailModel);
  }

  DailyItemInfoWeatherWidget.likeness(DailyItemInfoWeatherWidget likeWidget, this.isExpanded, {Key? key}) : super(key: key) {
    dailyWeatherItemModel = likeWidget.dailyWeatherItemModel;
    dailyWeatherDetailModel = likeWidget.dailyWeatherDetailModel;
  }

  @override
  State<StatefulWidget> createState() => _DailyItemInfoWeatherState();
}

class _DailyItemInfoWeatherState extends State<DailyItemInfoWeatherWidget> {

  @override
  Widget build(BuildContext context) {
    return widget.isExpanded ?
    Column(
        children: [
          _DailyInfoWeatherWidget(widget.dailyWeatherItemModel, isExpanded: true),
          _DailyDetailInfoWeatherWidget(widget.dailyWeatherDetailModel)
        ]
    ) :
    _DailyInfoWeatherWidget(widget.dailyWeatherItemModel);
  }
}

class _DailyInfoWeatherWidget extends StatelessWidget {

  final bool isExpanded;
  final DailyWeatherItemModel _dailyWeatherItemModel;

  const _DailyInfoWeatherWidget(this._dailyWeatherItemModel, { this.isExpanded = false });

  @override
  Widget build(BuildContext context) {
    String hi = "Wednesday";

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
                    child: Text(hi, style: const TextStyle(fontSize: ConstantUI.textDayOfWeekFontSize))
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                        "${_dailyWeatherItemModel.probabilityOfPrecipitation}%",
                        style: const TextStyle(fontSize: ConstantUI.textPercentAndTemperatureFontSize)
                    ),
                  ),
                ),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Row(
                      children: const [
                        Icon(
                            Icons.ac_unit,
                            size: ConstantUI.dailyWeatherIconSize),
                        SizedBox(width: 2),
                        Icon(
                            Icons.ac_unit,
                            size: ConstantUI.dailyWeatherIconSize),
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
                            style: const TextStyle(fontSize: ConstantUI.textPercentAndTemperatureFontSize)),
                      ),
                    )
                ),
                TableCell(child:
                isExpanded ?
                const Icon(Icons.add):
                const Icon(Icons.add_box)
                )
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
      buildDailyWeatherWidget(_dailyWeatherDetailModel.day, true),
      buildDailyWeatherWidget(_dailyWeatherDetailModel.night, false)];
    return BorderContainerWidget(
        outerPadding: 0,
        child: ColumnWithSeparator(
          itemCount: listWidget.length,
          separator: const SeparatorWidget(),
          itemBuilder: ((context, index) {
            return listWidget[index];
          }),
        )
    );
  }

  Widget buildDailyWeatherWidget(DailyWeatherModel model, bool isDay) {
    var namePeriod = isDay ? "Day" : "Night";

    return Table(
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(),
        2: IntrinsicColumnWidth()
      },
      children: [
        TableRow(
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        namePeriod,
                        style: const TextStyle(
                            fontSize: ConstantUI.textDayOfWeekFontSize),
                      ),
                    ),
                    const SizedBox(height: 5),
                    IconText(
                      "${model.averageTemperature}°",
                      Icons.ac_unit,
                      size: ConstantUI.textDayOfWeekFontSize
                    )
                  ],
                ),
              ),
              const SizedBox(width: 1),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconText("${model.rainfall}%", Icons.ac_unit),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconText("${model.windSpeed} m/c", Icons.access_alarm_outlined)
                    )
                  ]
                )
              )
            ],
        ),
        TableRow(
          children: [
            const SizedBox(),
            Align(
                alignment: Alignment.center,
                child: Text(model.description)),
            const SizedBox()
          ]
        )
      ]
    );
  }
}