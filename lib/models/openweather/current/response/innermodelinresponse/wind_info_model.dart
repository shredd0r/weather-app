import 'package:json_annotation/json_annotation.dart';

part 'wind_info_model.g.dart';

@JsonSerializable()
class WindInfoModel {

  late double? speed;
  @JsonKey(name: "deg")
  late double? degrees;
  late double? gust;

  WindInfoModel(
      {
        this.speed,
        this.degrees,
        this.gust
      });

  factory WindInfoModel.fromJson(Map<String, dynamic> json) => _$WindInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$WindInfoModelToJson(this);
}
