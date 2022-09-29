import 'package:json_annotation/json_annotation.dart';

part 'precipitation_info_dto.g.dart';

@JsonSerializable()
class PrecipitationInfoDto {

  @JsonKey(name: "1h")
  late double? volumeLastOneHour;

  @JsonKey(name: "3h")
  late double? volumeLastThreeHour;

  PrecipitationInfoDto(
      {
        this.volumeLastThreeHour,
        this.volumeLastOneHour
      });

  factory PrecipitationInfoDto.fromJson(Map<String, dynamic> json) => _$PrecipitationInfoDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PrecipitationInfoDtoToJson(this);
}