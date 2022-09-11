import 'package:flutter/material.dart';
import 'package:weather_app/src/services/mappers/mapper.dart';
import 'package:weather_app/src/static/constants.dart';
import 'package:weather_app/src/ui/widgets/common/border_container_widget.dart';
import '../../../models/daily_weather_model.dart';

class DailyWeatherWidget extends StatelessWidget {
  const DailyWeatherWidget(this._listDailyWeatherDetailModel, {Key? key}) : super(key: key);

  final List<DailyWeatherDetailModel> _listDailyWeatherDetailModel;

  @override
  Widget build(BuildContext context) {

    return Center(
      child: BorderContainerWidget(
        height: 300,
        width: 385,
        child: ListView.builder(
          itemCount: _listDailyWeatherDetailModel.length,
          itemBuilder: ((context, index) {
            return _DailyItemInfoWeatherWidget(_listDailyWeatherDetailModel[index]);
          })
        )
      )
    );
  }
}


class _DailyItemInfoWeatherWidget extends StatefulWidget {

  final DailyWeatherDetailModel dailyWeatherDetailModel;

  const _DailyItemInfoWeatherWidget(this.dailyWeatherDetailModel);

  @override
  State<StatefulWidget> createState() => _DailyItemInfoWeatherState(dailyWeatherDetailModel);
}

class _DailyItemInfoWeatherState extends State<_DailyItemInfoWeatherWidget> {

  late DailyWeatherItemModel dailyWeatherItemModel;
  late DailyWeatherDetailModel dailyWeatherDetailModel;

  _DailyItemInfoWeatherState(this.dailyWeatherDetailModel) {
    dailyWeatherItemModel = Mapper.mapDailyWeatherItemModel(dailyWeatherDetailModel);
  }

  @override
  Widget build(BuildContext context) {
    return Row(   // TODO fix this call
      children: [
        // Text(dailyWeatherItemModel.dayOfWeek.toString()),
        const Text("П'ятниця", style: TextStyle(fontSize: 18)),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Text("${dailyWeatherItemModel.probabilityOfPrecipitation}%"),
        ),
        const Icon(
          Icons.ac_unit,
          size: 28),
        const Text("/", style: TextStyle(fontSize: 18)),
        const Icon(
            Icons.ac_unit,
            size: 28),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Text("${dailyWeatherItemModel.maxTemperature}° / ${dailyWeatherItemModel.minTemperature}°",
            style: TextStyle(fontSize: 18)),
        ),
        const Icon(Icons.add)
      ],
    );
  }

}

class _DailyInfoWeatherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _DailyDetailInfoWeatherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}