class DailyWeatherDetailModel {

  DailyWeatherDetailModel(
      this.day,
      this.night);

  DailyWeatherModel day;
  DailyWeatherModel night;
}

class DailyWeatherModel {

  DailyWeatherModel(
      this.averageTemperature,
      this.minTemperature,
      this.maxTemperature,
      this.description,
      this.humidity,
      this.indexUV,
      this.sunriseTime,
      this.sunsetTime,
      this.windSpeed,
      this.rainfall,
      this.dayOfWeek,
      this.iconResource);

  double averageTemperature;
  double minTemperature;
  double maxTemperature;
  String description;
  double humidity;
  double indexUV;
  DateTime sunriseTime;
  DateTime sunsetTime;
  double windSpeed;
  double rainfall;
  int dayOfWeek;
  String iconResource;
}

class DailyWeatherItemModel {
  int dayOfWeek;
  double maxTemperature;
  double minTemperature;
  String iconResourceForDay;
  String iconResourceForNight;
  double probabilityOfPrecipitation;

  DailyWeatherItemModel(
      this.dayOfWeek,
      this.maxTemperature,
      this.minTemperature,
      this.iconResourceForDay,
      this.iconResourceForNight,
      this.probabilityOfPrecipitation);
}