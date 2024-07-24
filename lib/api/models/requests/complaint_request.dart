import 'package:json_annotation/json_annotation.dart';
import 'package:gde_namaz/api/models/models.dart';

part 'complaint_request.g.dart';

@JsonSerializable()
class ComplaintRequest {
  final Coordinates coordinates;
  final String complaintTypeId;

  ComplaintRequest({
    required this.coordinates,
    required this.complaintTypeId,
  });

  factory ComplaintRequest.fromJson(Map<String, dynamic> json) =>
      _$ComplaintRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ComplaintRequestToJson(this);
}
