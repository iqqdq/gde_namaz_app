part of 'create_venue_bloc.dart';

sealed class CreateVenueEvent extends Equatable {
  const CreateVenueEvent();
}

// final class CreateVenueInitialEvent extends CreateVenueEvent {
//   const CreateVenueInitialEvent({
//     this.openingDateTime,
//     this.closingDateTime,
//     this.isAroundTheClock = false,
//     this.hasToilet = false,
//     this.hasWashroom = false,
//   });

//   final DateTime? openingDateTime;
//   final DateTime? closingDateTime;
//   final bool? isAroundTheClock;
//   final bool? hasToilet;
//   final bool? hasWashroom;

//   @override
//   List<Object> get props => [
//         openingDateTime ?? DateTime.now().copyWith(hour: 6, minute: 0),
//         closingDateTime ?? DateTime.now().copyWith(hour: 23, minute: 0),
//         isAroundTheClock ?? false,
//         hasToilet ?? false,
//         hasWashroom ?? false,
//       ];
// }

final class CreateVenueAddressEvent extends CreateVenueEvent {
  const CreateVenueAddressEvent({
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

final class CreateVenueOpeningTimeEvent extends CreateVenueEvent {
  const CreateVenueOpeningTimeEvent({required this.openingDateTime});

  final DateTime openingDateTime;

  @override
  List<Object> get props => [openingDateTime];
}

final class CreateVenueClosingTimeEvent extends CreateVenueEvent {
  const CreateVenueClosingTimeEvent({required this.closingDateTime});

  final DateTime closingDateTime;

  @override
  List<Object> get props => [closingDateTime];
}

final class CreateVenueAroundTheClockEvent extends CreateVenueEvent {
  const CreateVenueAroundTheClockEvent({required this.isAroundTheClock});

  final bool isAroundTheClock;

  @override
  List<Object> get props => [isAroundTheClock];
}

final class CreateVenueHasToiletEvent extends CreateVenueEvent {
  const CreateVenueHasToiletEvent({required this.hasToilet});

  final bool hasToilet;

  @override
  List<Object> get props => [hasToilet];
}

final class CreateVenueHasWashroomEvent extends CreateVenueEvent {
  const CreateVenueHasWashroomEvent({required this.hasWashroom});

  final bool hasWashroom;

  @override
  List<Object> get props => [hasWashroom];
}

final class CreateVenueAddEvent extends CreateVenueEvent {
  const CreateVenueAddEvent({required this.venueRequest});

  final VenueRequest venueRequest;

  @override
  List<Object> get props => [venueRequest];
}
