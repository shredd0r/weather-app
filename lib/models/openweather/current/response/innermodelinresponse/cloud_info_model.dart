import 'package:json_annotation/json_annotation.dart';

part 'cloud_info_model.g.dart';

@JsonSerializable()
class CloudInfoModel {
  late int? all;

  CloudInfoModel({this.all});

  factory CloudInfoModel.fromJson(Map<String, dynamic> json) => _$CloudInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$CloudInfoModelToJson(this);
}