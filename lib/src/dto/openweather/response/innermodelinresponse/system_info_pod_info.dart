
import 'package:json_annotation/json_annotation.dart';

part 'system_info_pod_info.g.dart';

@JsonSerializable()
class SystemPodInfoDto {

  late String pod;

  SystemPodInfoDto(this.pod);

  factory SystemPodInfoDto.fromJson(Map<String, dynamic> json) => _$SystemPodInfoDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SystemPodInfoDtoToJson(this);
}