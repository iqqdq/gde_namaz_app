import 'package:gde_namaz/api/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'approvement_response.g.dart';

@JsonSerializable()
class ApprovementResponse {
  final String id;
  final String venueId;
  final String userId;
  final Coordinates coordinates;
  final DateTime createdAt;

  ApprovementResponse({
    required this.id,
    required this.venueId,
    required this.userId,
    required this.coordinates,
    required this.createdAt,
  });

  factory ApprovementResponse.fromJson(Map<String, dynamic> json) =>
      _$ApprovementResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApprovementResponseToJson(this);
}
