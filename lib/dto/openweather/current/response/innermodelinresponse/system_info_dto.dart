import 'package:json_annotation/json_annotation.dart';

part 'system_info_dto.g.dart';

@JsonSerializable()
class SystemInfoDto {
  late int? type;
  late int? id;
  late double? message;
  late String? country;
  late int? sunrise;
  late int? sunset;

  SystemInfoDto(
      {
        this.type,
        this.id,
        this.message,
        this.country,
        this.sunrise,
        this.sunset
      });

  factory SystemInfoDto.fromJson(Map<String, dynamic> json) => _$SystemInfoDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SystemInfoDtoToJson(this);
}