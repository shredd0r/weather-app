import 'package:json_annotation/json_annotation.dart';

part 'coordination_dto.g.dart';

@JsonSerializable()
class CoordinationDto {
  late double? lon;
  late double? lat;

  CoordinationDto({this.lon, this.lat});

  factory CoordinationDto.fromJson(Map<String, dynamic> json) => _$CoordinationDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CoordinationDtoToJson(this);
}