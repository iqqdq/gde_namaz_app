import 'package:json_annotation/json_annotation.dart';

part 'complaint_type.g.dart';

@JsonSerializable()
class ComplaintType {
  final String id;
  final String name;
  final String code;
  final DateTime createdAt;

  ComplaintType({
    required this.id,
    required this.name,
    required this.code,
    required this.createdAt,
  });

  factory ComplaintType.fromJson(Map<String, dynamic> json) =>
      _$ComplaintTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ComplaintTypeToJson(this);
}
