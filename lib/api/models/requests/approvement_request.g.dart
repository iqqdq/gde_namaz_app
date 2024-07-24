// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approvement_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApprovementRequest _$ApprovementRequestFromJson(Map<String, dynamic> json) =>
    ApprovementRequest(
      coordinates:
          Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApprovementRequestToJson(ApprovementRequest instance) =>
    <String, dynamic>{
      'coordinates': instance.coordinates,
    };
