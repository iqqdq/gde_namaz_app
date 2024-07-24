import 'package:json_annotation/json_annotation.dart';

part 'meta.g.dart';

@JsonSerializable()
class Meta {
  final int approvementsCount;
  final int complaintsCount;
  final bool currentUserApprovement;
  final bool currentUserComplaint;

  Meta({
    required this.approvementsCount,
    required this.complaintsCount,
    required this.currentUserApprovement,
    required this.currentUserComplaint,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
