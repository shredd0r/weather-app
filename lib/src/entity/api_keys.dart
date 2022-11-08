
import 'package:json_annotation/json_annotation.dart';

part 'api_keys.g.dart';

@JsonSerializable()
class ApiKeys {
  final int id;
  final String apiKey;
  final String serviceName;

  ApiKeys(this.id, this.apiKey, this.serviceName);

  factory ApiKeys.fromJson(Map<String, dynamic> json) => _$ApiKeysFromJson(json);
  Map<String, dynamic> toJson() => _$ApiKeysToJson(this);
}