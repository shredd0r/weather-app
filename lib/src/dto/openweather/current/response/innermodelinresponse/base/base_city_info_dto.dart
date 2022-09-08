
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/dto/openweather/current/response/innermodelinresponse/coordination_dto.dart';

class BaseCityInfoDto {

  @JsonKey(name: "id")
  late String cityId;

  late String name;

  @JsonKey(name: "coord")
  late CoordinationDto coordinationDto;


  BaseCityInfoDto(this.cityId, this.name, this.coordinationDto);
}