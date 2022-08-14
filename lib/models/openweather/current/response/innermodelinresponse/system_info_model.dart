import 'package:json_annotation/json_annotation.dart';

part 'system_info_model.g.dart';

@JsonSerializable()
class SystemInfoModel {
  late int? type;
  late int? id;
  late double? message;
  late String? country;
  late int? sunrise;
  late int? sunset;

  SystemInfoModel(
      {
        this.type,
        this.id,
        this.message,
        this.country,
        this.sunrise,
        this.sunset
      });

  factory SystemInfoModel.fromJson(Map<String, dynamic> json) => _$SystemInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$SystemInfoModelToJson(this);
}