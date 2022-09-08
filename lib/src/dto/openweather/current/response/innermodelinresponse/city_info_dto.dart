
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/dto/openweather/current/response/innermodelinresponse/coordination_dto.dart';

part 'city_info_dto.g.dart';

@JsonSerializable()
class CityInfoDto {

  @JsonKey(name: "id")
  late String cityId;

  late String name;

  @JsonKey(name: "coord")
  late CoordinationDto coordinationDto;


  CityInfoDto(this.cityId, this.name, this.coordinationDto);

  factory CityInfoDto.fromJson(Map<String, dynamic> json) => _$CityInfoDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CityInfoDtoToJson(this);
}