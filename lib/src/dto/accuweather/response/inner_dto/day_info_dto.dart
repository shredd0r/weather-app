import 'package:json_annotation/json_annotation.dart';

part 'day_info_dto.g.dart';

@JsonSerializable()
class DayInfoDto {

  late String rise;
  late int epochRise;
  late String set;
  late int epochSet;

  DayInfoDto(this.rise, this.epochRise, this.set, this.epochSet);

  factory DayInfoDto.fromJson(Map<String, dynamic> json) => _$DayInfoDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DayInfoDtoToJson(this);
}