import 'package:json_annotation/json_annotation.dart';

part 'temperature_info_dto.g.dart';

@JsonSerializable()
class TemperatureInfoDto {

  late double? value;
  late String unit;
  late int unitType;

  TemperatureInfoDto(this.unit, this.unitType, {this.value});

  factory TemperatureInfoDto.fromJson(Map<String, dynamic> json) => _$TemperatureInfoDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TemperatureInfoDtoToJson(this);
}

@JsonSerializable()
class TemperatureDetailInfoDto {

  late TemperatureInfoDto minimum;
  late TemperatureInfoDto maximum;

  TemperatureDetailInfoDto(this.maximum, this.minimum);

  factory TemperatureDetailInfoDto.fromJson(Map<String, dynamic> json) => _$TemperatureDetailInfoDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TemperatureDetailInfoDtoToJson(this);
}