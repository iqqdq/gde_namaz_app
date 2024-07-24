part of 'venue_bloc.dart';

sealed class VenueState extends Equatable {
  const VenueState();

  @override
  List<Object> get props => [];
}

final class VenueLoadingState extends VenueState {
  const VenueLoadingState();
}

final class VenueLoadedState extends VenueState {
  const VenueLoadedState({required this.venue});

  final Venue venue;

  @override
  List<Object> get props => [venue];
}

final class VenueComplaintTypesState extends VenueState {
  const VenueComplaintTypesState({required this.types});

  final List<ComplaintType> types;

  @override
  List<Object> get props => [types];
}

final class VenueSuccessState extends VenueState {
  const VenueSuccessState({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

final class VenueFailureState extends VenueState {
  const VenueFailureState({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
