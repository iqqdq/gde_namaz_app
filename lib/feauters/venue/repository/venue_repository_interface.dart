import 'package:dartz/dartz.dart';
import 'package:gde_namaz/api/models/models.dart';

abstract interface class VenueRepositoryInterface {
  Future<Either<FailureResponse, Venue>> getVenue({required String id});

  Future<Either<FailureResponse, ApprovementResponse>> addVenueApprovement({
    required String id,
    required ApprovementRequest approvementRequest,
  });

  Future<Either<FailureResponse, List<ComplaintType>>> getVenueComplaintTypes();

  Future<Either<FailureResponse, ComplaintResponse>> addVenueComplaint({
    required String id,
    required ComplaintRequest complaintRequest,
  });
}
