import 'package:json_annotation/json_annotation.dart';

part 'weather_settings.g.dart';

@JsonSerializable()
class CitySettings {
  late int id;
  late String city; // maybe cityId
  late String? cityId;
  late double latitude;
  late double longitude;

  CitySettings(this.id, this.city, this.latitude, this.longitude, {this.cityId});

  factory CitySettings.fromJson(Map<String, dynamic> json) => _$CitySettingsFromJson(json);
  Map<String, dynamic> toJson() => _$CitySettingsToJson(this);
}