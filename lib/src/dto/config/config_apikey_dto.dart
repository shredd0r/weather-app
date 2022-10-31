import 'package:json_annotation/json_annotation.dart';

part 'config_apikey_dto.g.dart';

@JsonSerializable()
class ApiKeyConfigurationDto {

  @JsonKey(name: "ninjas_key")
  late String ninjasApiKey;

  ApiKeyConfigurationDto(this.ninjasApiKey);

  Map<String, dynamic> toJson() => _$ApiKeyConfigurationDtoToJson(this);
  factory ApiKeyConfigurationDto.fromJson(Map<String, dynamic> json) => _$ApiKeyConfigurationDtoFromJson(json);
}