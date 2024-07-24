// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaint_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplaintType _$ComplaintTypeFromJson(Map<String, dynamic> json) =>
    ComplaintType(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ComplaintTypeToJson(ComplaintType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'createdAt': instance.createdAt.toIso8601String(),
    };
