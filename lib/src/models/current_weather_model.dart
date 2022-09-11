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
      this.iconResource,
      this.lastUpdate);

  late String cityName;
  late String dayOfWeek;
  late String visibility;
  late String month;
  late int day;
  late double currentTemperature;
  late double minTemperature;
  late double maxTemperature;
  late double fillLikeTemperature;
  late String iconResource;
  late DateTime lastUpdate;

  CurrentWeatherModel.emptyModel();
}