import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gde_namaz/api/models/models.dart';
import 'package:gde_namaz/feauters/create_venue/create_venue.dart';
import 'package:gde_namaz/generated/locale_keys.g.dart';

part 'create_venue_event.dart';
part 'create_venue_state.dart';

class CreateVenueBloc extends Bloc<CreateVenueEvent, CreateVenueState> {
  final CreateVenueRepositoryInterface _createVenueRepositoryInterface;

  CreateVenueBloc({
    required CreateVenueRepositoryInterface createVenueRepositoryInterface,
  })  : _createVenueRepositoryInterface = createVenueRepositoryInterface,
        super(CreateVenueState()) {
    on<CreateVenueAddEvent>((event, emit) async {
      emit(CreateVenueLoadingState());

      final result = await _createVenueRepositoryInterface.createVenue(
          venueRequest: event.venueRequest);
      result.fold(
        (l) => emit(CreateVenueFailureState(message: l.message)),
        (r) => emit(CreateVenueSuccessState(
          message: LocaleKeys.thePrayerRoomHasBeenAdded.tr(),
          venue: r,
        )),
      );
    });

    on<CreateVenueAddressEvent>((event, emit) => emit(state.copyWith(
          locality: event.locality,
          address: event.address,
          coordinates: event.coordinates,
        )));

    on<CreateVenueOpeningTimeEvent>((event, emit) => emit(state.copyWith(
          openingDateTime: event.openingDateTime,
        )));

    on<CreateVenueClosingTimeEvent>((event, emit) => emit(state.copyWith(
          closingDateTime: event.closingDateTime,
        )));

    on<CreateVenueAroundTheClockEvent>((event, emit) => emit(state.copyWith(
          isAroundTheClock: event.isAroundTheClock,
        )));

    on<CreateVenueHasWashroomEvent>((event, emit) => emit(state.copyWith(
          hasWashroom: event.hasWashroom,
        )));

    on<CreateVenueHasToiletEvent>((event, emit) => emit(state.copyWith(
          hasToilet: event.hasToilet,
        )));
  }
}
