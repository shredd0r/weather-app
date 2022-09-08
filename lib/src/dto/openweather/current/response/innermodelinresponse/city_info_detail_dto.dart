import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/dto/openweather/current/response/innermodelinresponse/base/base_city_info_dto.dart';
import 'package:weather_app/src/dto/openweather/current/response/innermodelinresponse/coordination_dto.dart';

part 'city_info_detail_dto.g.dart';

@JsonSerializable()
class CityInfoDetailDto extends BaseCityInfoDto {

  late String country;
  late int population;
  late int timezone;
  late int sunrise;
  late int sunset;

  CityInfoDetailDto(
      this.country,
      this.population,
      this.timezone,
      this.sunrise,
      this.sunset,
      String cityId,
      String name,
      CoordinationDto coordinationDto) : super(cityId, name, coordinationDto);

  factory CityInfoDetailDto.fromJson(Map<String, dynamic> json) => _$CityInfoDetailDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CityInfoDetailDtoToJson(this);
}