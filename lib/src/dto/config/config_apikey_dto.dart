import 'package:json_annotation/json_annotation.dart';

part 'config_apikey_dto.g.dart';

@JsonSerializable()
class ApiKeyConfigurationDto {

  @JsonKey(name: "openweather_key")
  late String openWeatherApiKey = "";

  @JsonKey(name: "accuweather_key")
  late String accuWeatherApiKey = "";

  @JsonKey(name: "theweather_key")
  late String theWeatherApiKey = "";

  @JsonKey(name: "ninjas_key")
  late String ninjasApiKey;

  ApiKeyConfigurationDto(
      this.openWeatherApiKey,
      this.accuWeatherApiKey,
      this.theWeatherApiKey);

  Map<String, dynamic> toJson() => _$ApiKeyConfigurationDtoToJson(this);
  factory ApiKeyConfigurationDto.fromJson(Map<String, dynamic> json) => _$ApiKeyConfigurationDtoFromJson(json);
}