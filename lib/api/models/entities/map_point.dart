import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'map_point.g.dart';

@JsonSerializable()
class MapPoint extends Equatable {
  final String id;
  final String type;
  final double lat;
  final double lng;

  const MapPoint({
    required this.id,
    required this.type,
    required this.lat,
    required this.lng,
  });

  factory MapPoint.fromJson(Map<String, dynamic> json) =>
      _$MapPointFromJson(json);

  Map<String, dynamic> toJson() => _$MapPointToJson(this);

  @override
  List<Object?> get props => [id, type, lat, lng]; // MARK:
}
