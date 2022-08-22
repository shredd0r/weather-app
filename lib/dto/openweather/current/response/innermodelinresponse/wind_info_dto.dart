import 'package:json_annotation/json_annotation.dart';

part 'wind_info_dto.g.dart';

@JsonSerializable()
class WindInfoDto {

  late double? speed;
  @JsonKey(name: "deg")
  late double? degrees;
  late double? gust;

  WindInfoDto(
      {
        this.speed,
        this.degrees,
        this.gust
      });

  factory WindInfoDto.fromJson(Map<String, dynamic> json) => _$WindInfoDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WindInfoDtoToJson(this);
}
