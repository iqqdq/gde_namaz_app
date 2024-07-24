// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaint_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplaintRequest _$ComplaintRequestFromJson(Map<String, dynamic> json) =>
    ComplaintRequest(
      coordinates:
          Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      complaintTypeId: json['complaintTypeId'] as String,
    );

Map<String, dynamic> _$ComplaintRequestToJson(ComplaintRequest instance) =>
    <String, dynamic>{
      'coordinates': instance.coordinates,
      'complaintTypeId': instance.complaintTypeId,
    };
