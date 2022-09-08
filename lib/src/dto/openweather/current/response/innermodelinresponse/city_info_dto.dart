
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/dto/openweather/current/response/innermodelinresponse/base/base_city_info_dto.dart';
import 'package:weather_app/src/dto/openweather/current/response/innermodelinresponse/coordination_dto.dart';

part 'city_info_dto.g.dart';

@JsonSerializable()
class CityInfoDto extends BaseCityInfoDto {
  CityInfoDto(
      String cityId,
      String name,
      CoordinationDto coordinationDto) : super(cityId, name, coordinationDto);

  factory CityInfoDto.fromJson(Map<String, dynamic> json) => _$CityInfoDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CityInfoDtoToJson(this);
}