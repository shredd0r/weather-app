import 'package:json_annotation/json_annotation.dart';

part 'geocoding_request.g.dart';

@JsonSerializable()
class GeocodingRequestDto {
  final String city;
  late String country;
  late String state;

  GeocodingRequestDto({required this.city, required this.country, required this.state});

  Map<String, dynamic> toJson() => _$GeocodingRequestDtoToJson(this);
  factory GeocodingRequestDto.fromJson(Map<String, dynamic> json) => _$GeocodingRequestDtoFromJson(json);
}