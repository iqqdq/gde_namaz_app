// ignore_for_file: must_be_immutable

part of 'create_venue_bloc.dart';

// sealed class CreateVenueState extends Equatable {
//   const CreateVenueState();

//   @override
//   List<Object> get props => [];
// }

// final class CreateVenueInitialState extends CreateVenueState {
final class CreateVenueState extends Equatable {
  CreateVenueState({
    this.locality = '',
    this.address = '',
    this.coordinates,
    this.openingDateTime,
    this.closingDateTime,
    this.isAroundTheClock = false,
    this.hasToilet = false,
    this.hasWashroom = false,
  });

  String locality;
  String address;
  Coordinates? coordinates;
  DateTime? openingDateTime;
  DateTime? closingDateTime;
  bool isAroundTheClock;
  bool hasToilet;
  bool hasWashroom;

  @override
  List<Object> get props => [
        locality,
        address,
        coordinates ?? Coordinates(lat: 0.0, lng: 0.0),
        openingDateTime ?? DateTime.now().copyWith(hour: 6, minute: 0),
        closingDateTime ?? DateTime.now().copyWith(hour: 23, minute: 0),
        isAroundTheClock,
        hasToilet,
        hasWashroom,
      ];

  CreateVenueState copyWith({
    String? locality,
    String? address,
    Coordinates? coordinates,
    DateTime? openingDateTime,
    DateTime? closingDateTime,
    bool? isAroundTheClock,
    bool? hasToilet,
    bool? hasWashroom,
  }) {
    return CreateVenueState(
      locality: locality ?? this.locality,
      address: address ?? this.address,
      coordinates: coordinates ?? this.coordinates,
      openingDateTime: openingDateTime ?? this.openingDateTime,
      closingDateTime: closingDateTime ?? this.closingDateTime,
      isAroundTheClock: isAroundTheClock ?? this.isAroundTheClock,
      hasToilet: hasToilet ?? this.hasToilet,
      hasWashroom: hasWashroom ?? this.hasWashroom,
    );
  }
}

final class CreateVenueLoadingState extends CreateVenueState {
  CreateVenueLoadingState();
}

final class CreateVenueSuccessState extends CreateVenueState {
  CreateVenueSuccessState({
    required this.message,
    required this.venue,
  });

  final String message;
  final Venue venue;

  @override
  List<Object> get props => [
        message,
        venue,
      ];
}

final class CreateVenueFailureState extends CreateVenueState {
  CreateVenueFailureState({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
