import 'package:json_annotation/json_annotation.dart';
import 'package:gde_namaz/api/models/models.dart';

part 'venue_request.g.dart';

@JsonSerializable()
class VenueRequest {
  final String venueType;
  final String caption;
  final String comment;
  final String description;
  final Coordinates coordinates;
  final String address;
  final bool hasToilet;
  final bool hasWashroom;
  final String openingTime;
  final String closingTime;

  VenueRequest({
    required this.venueType,
    required this.caption,
    required this.comment,
    required this.description,
    required this.coordinates,
    required this.address,
    required this.hasToilet,
    required this.hasWashroom,
    required this.openingTime,
    required this.closingTime,
  });

  factory VenueRequest.fromJson(Map<String, dynamic> json) =>
      _$VenueRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VenueRequestToJson(this);
}
