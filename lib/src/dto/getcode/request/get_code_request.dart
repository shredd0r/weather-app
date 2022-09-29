import 'package:json_annotation/json_annotation.dart';

part 'get_code_request.g.dart';

@JsonSerializable()
class GetCodeRequestDto {

  late double latitude;
  late double longitude;
  late String? localityLanguage;

  GetCodeRequestDto({required this.latitude, required this.longitude, this.localityLanguage});

  factory GetCodeRequestDto.fromJson(Map<String, dynamic> json) => _$GetCodeRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GetCodeRequestDtoToJson(this);
}