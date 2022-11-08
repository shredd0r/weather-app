import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/entity/weather_settings.dart';

part 'favorite_settings.g.dart';

@JsonSerializable()
class FavoriteCitySettings {
  final int id;
  final CitySettings citySettings;

  FavoriteCitySettings(this.id, this.citySettings);

  factory FavoriteCitySettings.fromJson(Map<String, dynamic> json) => _$FavoriteCitySettingsFromJson(json);
  Map<String, dynamic> toJson() => _$FavoriteCitySettingsToJson(this);
}