import 'package:json_annotation/json_annotation.dart';

part 'precipitation_info_model.g.dart';

@JsonSerializable()
class PrecipitationInfoModel {

  @JsonKey(name: "1h")
  late double? volumeLastOneHour;

  @JsonKey(name: "3h")
  late double? volumeLastThreeHour;

  PrecipitationInfoModel(
      {
        this.volumeLastThreeHour,
        this.volumeLastOneHour
      });

  factory PrecipitationInfoModel.fromJson(Map<String, dynamic> json) => _$PrecipitationInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$PrecipitationInfoModelToJson(this);
}