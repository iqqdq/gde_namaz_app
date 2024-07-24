// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaint_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplaintResponse _$ComplaintResponseFromJson(Map<String, dynamic> json) =>
    ComplaintResponse(
      id: json['id'] as String,
      venueId: json['venueId'] as String,
      userId: json['userId'] as String,
      complaintTypeId: json['complaintTypeId'] as String,
      coordinates:
          Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ComplaintResponseToJson(ComplaintResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'venueId': instance.venueId,
      'userId': instance.userId,
      'complaintTypeId': instance.complaintTypeId,
      'coordinates': instance.coordinates,
      'createdAt': instance.createdAt.toIso8601String(),
    };
