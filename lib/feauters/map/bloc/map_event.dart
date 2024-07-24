part of 'map_bloc.dart';

sealed class MapEvent extends Equatable {
  const MapEvent();
}

final class MapPointsEvent extends MapEvent {
  const MapPointsEvent({required this.venueFilter});

  final VenueFilter venueFilter;

  @override
  List<Object> get props => [venueFilter];
}

final class MapPointEvent extends MapEvent {
  const MapPointEvent({
    required this.message,
    required this.point,
  });

  final String message;
  final MapPoint point;

  @override
  List<Object> get props => [
        message,
        point,
      ];
}

final class MapMessageEvent extends MapEvent {
  const MapMessageEvent({
    required this.isFaulire,
    required this.message,
  });

  final bool isFaulire;
  final String message;

  @override
  List<Object> get props => [
        isFaulire,
        message,
      ];
}

final class MapVenuePanelEvent extends MapEvent {
  const MapVenuePanelEvent({required this.point});

  final MapPoint point;

  @override
  List<Object> get props => [point];
}

final class MapFilterPanelEvent extends MapEvent {
  const MapFilterPanelEvent();

  @override
  List<Object> get props => [];
}

final class MapCreateVenuePanelEvent extends MapEvent {
  const MapCreateVenuePanelEvent({
    required this.locality,
    required this.address,
    required this.coordinates,
  });

  final String locality;
  final String address;
  final Coordinates coordinates;

  @override
  List<Object> get props => [
        locality,
        address,
        coordinates,
      ];
}

final class MapHidePanelEvent extends MapEvent {
  const MapHidePanelEvent();

  @override
  List<Object> get props => [];
}
