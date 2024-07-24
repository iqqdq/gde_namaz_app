import 'package:gde_namaz/api/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'venue.g.dart';

@JsonSerializable()
class Venue {
  final String id;
  final String? userId;
  final String venueType;
  final String caption;
  final String? comment;
  final String? description;
  final Coordinates coordinates;
  final String address;
  final bool? hasToilet;
  final bool? hasWashroom;
  final String? openingTime;
  final String? closingTime;
  final String status;
  final DateTime createdAt;
  final Meta? meta;

  Venue({
    required this.id,
    required this.userId,
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
    required this.status,
    required this.createdAt,
    this.meta,
  });

  factory Venue.fromJson(Map<String, dynamic> json) => _$VenueFromJson(json);

  Map<String, dynamic> toJson() => _$VenueToJson(this);
}
