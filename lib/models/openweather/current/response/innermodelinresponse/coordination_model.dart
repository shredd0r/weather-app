import 'package:json_annotation/json_annotation.dart';

part 'coordination_model.g.dart';

@JsonSerializable()
class CoordinationModel {
  late double? lon;
  late double? lat;

  CoordinationModel({this.lon, this.lat});

  factory CoordinationModel.fromJson(Map<String, dynamic> json) => _$CoordinationModelFromJson(json);
  Map<String, dynamic> toJson() => _$CoordinationModelToJson(this);
}