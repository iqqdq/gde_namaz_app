import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gde_namaz/api/models/models.dart';
import 'package:gde_namaz/feauters/map/repository/map.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final MapRepositoryInterface _mapRepositoryInterface;
  final List<MapPoint> _points = [];

  MapBloc({
    required MapRepositoryInterface mapRepositoryInterface,
  })  : _mapRepositoryInterface = mapRepositoryInterface,
        super(const MapInitialState()) {
    on<MapEvent>((event, emit) => {});

    on<MapPointsEvent>((event, emit) async {
      final result = await _mapRepositoryInterface.getMapPoints();
      result.fold(
        (l) => emit(MapFailureState(message: l.message)),
        (r) {
          _points.addAll(r);
          emit(MapLoadedState(points: _points));
        },
      );
    });

    on<MapPointEvent>((event, emit) async {
      _points.add(event.point);
      emit(MapLoadedState(points: _points));
      emit(MapSuccessState(message: event.message));
    });

    on<MapMessageEvent>((event, emit) => emit(event.isFaulire
        ? MapFailureState(message: event.message)
        : MapSuccessState(message: event.message)));

    on<MapHidePanelEvent>((event, emit) => emit(const MapInitialState()));

    on<MapVenuePanelEvent>(
        (event, emit) => emit(MapVenueState(point: event.point)));

    on<MapFilterPanelEvent>((event, emit) => emit(const MapFilterState()));

    on<MapCreateVenuePanelEvent>((event, emit) => emit(MapCreateVenueState(
          locality: event.locality,
          address: event.address,
          coordinates: event.coordinates,
        )));
  }
}
