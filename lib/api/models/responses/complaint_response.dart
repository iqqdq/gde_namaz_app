import 'package:gde_namaz/api/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'complaint_response.g.dart';

@JsonSerializable()
class ComplaintResponse {
  final String id;
  final String venueId;
  final String userId;
  final String complaintTypeId;
  final Coordinates coordinates;
  final DateTime createdAt;

  ComplaintResponse({
    required this.id,
    required this.venueId,
    required this.userId,
    required this.complaintTypeId,
    required this.coordinates,
    required this.createdAt,
  });

  factory ComplaintResponse.fromJson(Map<String, dynamic> json) =>
      _$ComplaintResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ComplaintResponseToJson(this);
}
