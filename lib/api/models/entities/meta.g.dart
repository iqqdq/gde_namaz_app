// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      approvementsCount: (json['approvementsCount'] as num).toInt(),
      complaintsCount: (json['complaintsCount'] as num).toInt(),
      currentUserApprovement: json['currentUserApprovement'] as bool,
      currentUserComplaint: json['currentUserComplaint'] as bool,
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'approvementsCount': instance.approvementsCount,
      'complaintsCount': instance.complaintsCount,
      'currentUserApprovement': instance.currentUserApprovement,
      'currentUserComplaint': instance.currentUserComplaint,
    };
