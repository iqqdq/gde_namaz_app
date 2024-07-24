part of 'venue_bloc.dart';

sealed class VenueEvent extends Equatable {
  const VenueEvent();
}

final class VenueLoadEvent extends VenueEvent {
  const VenueLoadEvent({required this.id});

  final String id;

  @override
  List<Object> get props => [id];
}

final class VenueApprovementEvent extends VenueEvent {
  const VenueApprovementEvent({
    required this.id,
    required this.approvementRequest,
  });

  final String id;
  final ApprovementRequest approvementRequest;

  @override
  List<Object> get props => [
        id,
        approvementRequest,
      ];
}

final class VenueComplaintEvent extends VenueEvent {
  const VenueComplaintEvent({
    required this.id,
    required this.coordinates,
    required this.types,
  });

  final String id;
  final Coordinates coordinates;
  final List<ComplaintType> types;

  @override
  List<Object> get props => [
        id,
        coordinates,
        types,
      ];
}

final class VenueComplaintTypesEvent extends VenueEvent {
  const VenueComplaintTypesEvent();

  @override
  List<Object?> get props => [];
}
