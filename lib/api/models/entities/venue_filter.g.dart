// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venue_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VenueFilter _$VenueFilterFromJson(Map<String, dynamic> json) => VenueFilter(
      caption: json['caption'] as String,
      hasToilet: json['hasToilet'] as bool,
      hasWashroom: json['hasWashroom'] as bool,
    );

Map<String, dynamic> _$VenueFilterToJson(VenueFilter instance) =>
    <String, dynamic>{
      'caption': instance.caption,
      'hasToilet': instance.hasToilet,
      'hasWashroom': instance.hasWashroom,
    };
