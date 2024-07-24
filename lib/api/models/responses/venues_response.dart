import 'package:gde_namaz/api/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'venues_response.g.dart';

@JsonSerializable()
class VenuesResponse {
  final List<Venue> venues;

  VenuesResponse({
    required this.venues,
  });

  factory VenuesResponse.fromJson(Map<String, dynamic> json) =>
      _$VenuesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VenuesResponseToJson(this);
}
