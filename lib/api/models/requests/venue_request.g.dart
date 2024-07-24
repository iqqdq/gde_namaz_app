// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venue_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VenueRequest _$VenueRequestFromJson(Map<String, dynamic> json) => VenueRequest(
      venueType: json['venueType'] as String,
      caption: json['caption'] as String,
      comment: json['comment'] as String,
      description: json['description'] as String,
      coordinates:
          Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      address: json['address'] as String,
      hasToilet: json['hasToilet'] as bool,
      hasWashroom: json['hasWashroom'] as bool,
      openingTime: json['openingTime'] as String,
      closingTime: json['closingTime'] as String,
    );

Map<String, dynamic> _$VenueRequestToJson(VenueRequest instance) =>
    <String, dynamic>{
      'venueType': instance.venueType,
      'caption': instance.caption,
      'comment': instance.comment,
      'description': instance.description,
      'coordinates': instance.coordinates,
      'address': instance.address,
      'hasToilet': instance.hasToilet,
      'hasWashroom': instance.hasWashroom,
      'openingTime': instance.openingTime,
      'closingTime': instance.closingTime,
    };
