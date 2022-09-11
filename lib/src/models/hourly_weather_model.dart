class HourlyWeatherModel {

  HourlyWeatherModel(
      this.temperature,
      this.time,
      this.probabilityOfPrecipitation,
      this.iconResource);

  double temperature;
  DateTime time;
  double probabilityOfPrecipitation;
  String iconResource;
}