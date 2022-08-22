import 'package:json_annotation/json_annotation.dart';

part 'cloud_info_dto.g.dart';

@JsonSerializable()
class CloudInfoDto {
  late int? all;

  CloudInfoDto({this.all});

  factory CloudInfoDto.fromJson(Map<String, dynamic> json) => _$CloudInfoDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CloudInfoDtoToJson(this);
}