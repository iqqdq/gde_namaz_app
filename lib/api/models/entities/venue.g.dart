// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Venue _$VenueFromJson(Map<String, dynamic> json) => Venue(
      id: json['id'] as String,
      userId: json['userId'] as String?,
      venueType: json['venueType'] as String,
      caption: json['caption'] as String,
      comment: json['comment'] as String?,
      description: json['description'] as String?,
      coordinates:
          Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      address: json['address'] as String,
      hasToilet: json['hasToilet'] as bool?,
      hasWashroom: json['hasWashroom'] as bool?,
      openingTime: json['openingTime'] as String?,
      closingTime: json['closingTime'] as String?,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VenueToJson(Venue instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
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
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'meta': instance.meta,
    };
