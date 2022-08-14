import 'package:json_annotation/json_annotation.dart';

part 'main_info_model.g.dart';

@JsonSerializable()
class MainInfoModel {

  @JsonKey(name: "temp")
  late double? temperature;
  @JsonKey(name: "feels_like")
  late double? feelsLike;
  @JsonKey(name: "temp_min")
  late double? minTemperature;
  @JsonKey(name: "temp_max")
  late double? maxTemperature;
  late double? pressure;
  late int? humidity;

  MainInfoModel(
      {
        this.temperature,
        this.feelsLike,
        this.minTemperature,
        this.maxTemperature,
        this.pressure,
        this.humidity
      });

  factory MainInfoModel.fromJson(Map<String, dynamic> json) => _$MainInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$MainInfoModelToJson(this);
}