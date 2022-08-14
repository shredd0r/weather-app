class CurrentWeatherModel {

  CurrentWeatherModel(
      this.cityName,
      this.dayOfWeek,
      this.visibility,
      this.month,
      this.day,
      this.currentTemperature,
      this.minTemperature,
      this.maxTemperature,
      this.fillLikeTemperature,
      this.lastUpdate);

  String cityName;
  String dayOfWeek;
  String visibility;
  String month;
  int day;
  double currentTemperature;
  double minTemperature;
  double maxTemperature;
  double fillLikeTemperature;
  DateTime lastUpdate;


}