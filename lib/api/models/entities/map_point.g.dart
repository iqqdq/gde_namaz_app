// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapPoint _$MapPointFromJson(Map<String, dynamic> json) => MapPoint(
      id: json['id'] as String,
      type: json['type'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$MapPointToJson(MapPoint instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'lat': instance.lat,
      'lng': instance.lng,
    };
