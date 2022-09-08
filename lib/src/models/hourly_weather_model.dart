class HourlyWeatherModel {

  HourlyWeatherModel(
      this.temperature,
      this.time,
      this.probabilityOfPrecipitation);

  double temperature;
  DateTime time;
  double probabilityOfPrecipitation;
}