import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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

    return Table(
        columnWidths: const <int, TableColumnWidth> {
          0: FlexColumnWidth()
        },
        defaultColumnWidth: const IntrinsicColumnWidth(),
        children: [
          TableRow(
              children: [
                _firstCell(context),
                _secondCell(context),
                _thirdCell(context),
                _fourthCell(context),
                _fifthCell(context)
              ]
          )
        ]
    );
  }

  Widget _firstCell(BuildContext context) {
    String hi = AppLocalizations.of(context)!.wednesday;

    return TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Text(hi, style: const TextStyle(fontSize: ConstantUI.textDayOfWeekFontSize))
    );
  }

  Widget _secondCell(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Text(
            "${_dailyWeatherItemModel.probabilityOfPrecipitation}%",
            style: const TextStyle(fontSize: ConstantUI.textPercentAndTemperatureFontSize)
        ),
      ),
    );
  }

  Widget _thirdCell(BuildContext context) {
    return TableCell(
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
    );
  }

  Widget _fourthCell(BuildContext context) {
    return TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Text("${_dailyWeatherItemModel.maxTemperature}° / ${_dailyWeatherItemModel.minTemperature}°",
                style: const TextStyle(fontSize: ConstantUI.textPercentAndTemperatureFontSize)),
          ),
        )
    );
  }

  Widget _fifthCell(BuildContext context) {
    return TableCell(child:
      isExpanded ?
      const Icon(Icons.add):
      const Icon(Icons.add_box)
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

    return Column(
      children: [
        Table(
          columnWidths: const <int, TableColumnWidth>{
            0: IntrinsicColumnWidth(),
            1: FlexColumnWidth(),
            2: IntrinsicColumnWidth()
          },
          children: [
            TableRow(
                children: [
                  _firstCell(model, isDay),
                  const SizedBox(width: 1),
                  _thirdCell(model)
                ],
            ),
          ]
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: ConstantUI.paddingSize, bottom: ConstantUI.paddingSize),
            child: Text(model.description, style: const TextStyle(fontSize: ConstantUI.textPercentAndTemperatureFontSize)),
          ),
        ),
        BorderContainerWidget(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text("Влажность"),
                        Text(model.humidity.toString())
                      ]
                    )
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text("UV индекс"),
                        Text(model.indexUV.toString())
                      ],
                    )
                  ),
                ],
              ),
              const SeparatorWidget(),
              Row(
                children: [
                  Expanded(
                      child: Column(
                          children: [
                            Text("восход"),
                            Text(model.sunriseTime.toString())
                          ]
                      )
                  ),
                  Expanded(
                      child: Column(
                        children: [
                          Text("закат"),
                          Text(model.sunsetTime.toString())
                        ],
                      )
                  ),
                ],
              ),
            ],
          )
        )
      ],
    );
  }

  Widget _firstCell(DailyWeatherModel model, bool isDay) {
    var namePeriod = isDay ? "Day" : "Night";

    return TableCell(
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
    );
  }

  Widget _thirdCell(DailyWeatherModel model) {
    return TableCell(
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
    );
  }
}