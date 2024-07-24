import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gde_namaz/api/models/models.dart';
import 'package:gde_namaz/feauters/venue/repository/venue.dart';
import 'package:gde_namaz/generated/locale_keys.g.dart';

part 'venue_event.dart';
part 'venue_state.dart';

class VenueBloc extends Bloc<VenueEvent, VenueState> {
  final VenueRepositoryInterface _venueRepositoryInterface;

  VenueBloc({
    required VenueRepositoryInterface venueRepositoryInterface,
  })  : _venueRepositoryInterface = venueRepositoryInterface,
        super(const VenueLoadingState()) {
    on<VenueLoadEvent>((event, emit) async {
      emit(const VenueLoadingState());

      final result = await _venueRepositoryInterface.getVenue(id: event.id);
      result.fold(
        (l) => emit(VenueFailureState(message: l.message)),
        (r) => emit(VenueLoadedState(venue: r)),
      );
    });

    on<VenueApprovementEvent>((event, emit) async {
      emit(const VenueLoadingState());

      final result = await _venueRepositoryInterface.addVenueApprovement(
        id: event.id,
        approvementRequest: event.approvementRequest,
      );
      result.fold(
        (l) => emit(VenueFailureState(message: l.message)),
        (r) => emit(VenueSuccessState(
            message: LocaleKeys.theApprovementHasBeenAdded.tr())),
      );
    });

    on<VenueComplaintTypesEvent>((event, emit) async {
      emit(const VenueLoadingState());

      final result = await _venueRepositoryInterface.getVenueComplaintTypes();
      result.fold(
        (l) => emit(VenueFailureState(message: l.message)),
        (r) => emit(VenueComplaintTypesState(types: r)),
      );
    });

    on<VenueComplaintEvent>((event, emit) async {
      emit(const VenueLoadingState());

      final result = await _venueRepositoryInterface.addVenueComplaint(
        id: event.id,
        complaintRequest: ComplaintRequest(
          coordinates: event.coordinates,
          complaintTypeId: event.types.first.id,
        ),
      );
      result.fold(
        (l) => emit(VenueFailureState(message: l.message)),
        (r) => emit(VenueSuccessState(
            message: LocaleKeys.theComplaintHasBeenAdded.tr())),
      );
    });
  }
}
