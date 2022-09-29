import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/dto/openweather/response/innermodelinresponse/coordination_dto.dart';

class BaseCityInfoDto {

  @JsonKey(name: "id")
  late int cityId;

  late String name;

  @JsonKey(name: "coord")
  late CoordinationDto coordinationDto;


  BaseCityInfoDto(this.cityId, this.name, this.coordinationDto);
}