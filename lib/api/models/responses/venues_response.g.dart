// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venues_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VenuesResponse _$VenuesResponseFromJson(Map<String, dynamic> json) =>
    VenuesResponse(
      venues: (json['venues'] as List<dynamic>)
          .map((e) => Venue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VenuesResponseToJson(VenuesResponse instance) =>
    <String, dynamic>{
      'venues': instance.venues,
    };
