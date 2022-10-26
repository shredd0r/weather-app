import 'package:json_annotation/json_annotation.dart';

part 'headline_dto.g.dart';

@JsonSerializable()
class HeadLineDto {

  late String effectiveDate;
  late int effectiveEpochDate;
  late int severity;
  late String text;
  late String category;
  late String endDate;
  late int endEpochDate;
  late String mobileLink;
  late String link;

  HeadLineDto(
      this.effectiveDate,
      this.effectiveEpochDate,
      this.severity,
      this.text,
      this.category,
      this.endDate,
      this.endEpochDate,
      this.mobileLink,
      this.link);

  factory HeadLineDto.fromJson(Map<String, dynamic> json) => _$HeadLineDtoFromJson(json);
  Map<String, dynamic> toJson() => _$HeadLineDtoToJson(this);
}