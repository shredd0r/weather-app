import 'package:json_annotation/json_annotation.dart';

part 'get_code_response.g.dart';

@JsonSerializable()
class GetCodeResponseDto {

  final String city;

  GetCodeResponseDto(this.city);

  factory GetCodeResponseDto.fromJson(Map<String, dynamic> json) => _$GetCodeResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GetCodeResponseDtoToJson(this);
}