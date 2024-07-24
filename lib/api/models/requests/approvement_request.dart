import 'package:json_annotation/json_annotation.dart';
import 'package:gde_namaz/api/models/models.dart';

part 'approvement_request.g.dart';

@JsonSerializable()
class ApprovementRequest {
  final Coordinates coordinates;

  ApprovementRequest({
    required this.coordinates,
  });

  factory ApprovementRequest.fromJson(Map<String, dynamic> json) =>
      _$ApprovementRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ApprovementRequestToJson(this);
}
