import 'package:json_annotation/json_annotation.dart';

part 'geocoding_response.g.dart';

@JsonSerializable()
class GeocodingResponseDto {

  late String name;
  late double latitude;
  late double longitude;
  late String country;

  GeocodingResponseDto(this.name, this.latitude, this.longitude, this.country);

  Map<String, dynamic> toJson() => _$GeocodingResponseDtoToJson(this);
  factory GeocodingResponseDto.fromJson(Map<String, dynamic> json) => _$GeocodingResponseDtoFromJson(json);
}