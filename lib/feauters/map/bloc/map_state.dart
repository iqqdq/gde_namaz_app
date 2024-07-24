part of 'map_bloc.dart';

sealed class MapState extends Equatable {
  const MapState();

  @override
  List<Object> get props => [];
}

final class MapInitialState extends MapState {
  const MapInitialState();
}

final class MapLoadedState extends MapState {
  const MapLoadedState({required this.points});

  final List<MapPoint> points;

  @override
  List<Object> get props => [points];
}

final class MapCreatedState extends MapState {
  const MapCreatedState({
    required this.message,
    required this.points,
  });

  final String message;
  final List<MapPoint> points;

  @override
  List<Object> get props => [
        message,
        points,
      ];
}

final class MapSuccessState extends MapState {
  const MapSuccessState({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

final class MapFailureState extends MapState {
  const MapFailureState({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

final class MapVenueState extends MapState {
  const MapVenueState({required this.point});

  final MapPoint point;

  @override
  List<Object> get props => [point];
}

final class MapFilterState extends MapState {
  const MapFilterState();

  @override
  List<Object> get props => [];
}

final class MapCreateVenueState extends MapState {
  const MapCreateVenueState({
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
