import 'package:dartz/dartz.dart';
import 'package:gde_namaz/api/models/models.dart';

abstract interface class CreateVenueRepositoryInterface {
  Future<Either<FailureResponse, Venue>> createVenue(
      {required VenueRequest venueRequest});
}
