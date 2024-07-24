import 'package:json_annotation/json_annotation.dart';

part 'venue_filter.g.dart';

@JsonSerializable()
class VenueFilter {
  String caption;
  bool hasToilet;
  bool hasWashroom;

  VenueFilter({
    required this.caption,
    required this.hasToilet,
    required this.hasWashroom,
  });

  factory VenueFilter.fromJson(Map<String, dynamic> json) =>
      _$VenueFilterFromJson(json);

  Map<String, dynamic> toJson() => _$VenueFilterToJson(this);
}
