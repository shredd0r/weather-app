import 'api_keys.dart';

class WeatherProviders {
  final int id;
  final String name;
  final int countRequestPerDay;
  final ApiKeys apiKey;

  WeatherProviders(this.id, this.name, this.apiKey, this.countRequestPerDay);
}