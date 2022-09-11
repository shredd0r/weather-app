class DailyWeatherInfoModel {

  DailyWeatherInfoModel(
      this.day,
      this.night);

  DailyWeatherModel day;
  DailyWeatherModel night;
}

class DailyWeatherModel {

  DailyWeatherModel(
      this.averageTemperature,
      this.description,
      this.humidity,
      this.indexUV,
      this.sunriseTime,
      this.sunsetTime,
      this.windSpeed,
      this.rainfall,
      this.iconResource);

  double averageTemperature;
  String description;
  double humidity;
  double indexUV;
  DateTime sunriseTime;
  DateTime sunsetTime;
  double windSpeed;
  double rainfall;
  String iconResource;
}