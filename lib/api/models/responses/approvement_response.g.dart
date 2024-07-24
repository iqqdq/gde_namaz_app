// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approvement_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApprovementResponse _$ApprovementResponseFromJson(Map<String, dynamic> json) =>
    ApprovementResponse(
      id: json['id'] as String,
      venueId: json['venueId'] as String,
      userId: json['userId'] as String,
      coordinates:
          Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ApprovementResponseToJson(
        ApprovementResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'venueId': instance.venueId,
      'userId': instance.userId,
      'coordinates': instance.coordinates,
      'createdAt': instance.createdAt.toIso8601String(),
    };
