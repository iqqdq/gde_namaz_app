import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gde_namaz/api/api.dart';
import 'package:gde_namaz/api/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'venue.dart';

class VenueRepository implements VenueRepositoryInterface {
  VenueRepository({
    required this.apiClient,
    required this.sharedPreferences,
  });

  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  @override
  Future<Either<FailureResponse, Venue>> getVenue({required String id}) async {
    String? token = sharedPreferences.getString('token');

    if (token == null) {
      return Left(FailureResponse(message: 'Token is missing'));
    }

    try {
      final response = await apiClient.getVenue(
        token,
        id,
      );

      return Right(response);
    } on DioException catch (e) {
      return Left(FailureResponse.fromJson(e.response?.data));
    }
  }

  @override
  Future<Either<FailureResponse, ApprovementResponse>> addVenueApprovement({
    required String id,
    required ApprovementRequest approvementRequest,
  }) async {
    String? token = sharedPreferences.getString('token');

    if (token == null) {
      return Left(FailureResponse(message: 'Token is missing'));
    }

    try {
      final response = await apiClient.postApprovement(
        token,
        id,
        approvementRequest,
      );

      return Right(response);
    } on DioException catch (e) {
      return Left(FailureResponse.fromJson(e.response?.data));
    }
  }

  @override
  Future<Either<FailureResponse, List<ComplaintType>>>
      getVenueComplaintTypes() async {
    try {
      final response = await apiClient.getComplaintTypes();

      return Right(response);
    } on DioException catch (e) {
      return Left(FailureResponse.fromJson(e.response?.data));
    }
  }

  @override
  Future<Either<FailureResponse, ComplaintResponse>> addVenueComplaint({
    required String id,
    required ComplaintRequest complaintRequest,
  }) async {
    String? token = sharedPreferences.getString('token');

    if (token == null) {
      return Left(FailureResponse(message: 'Token is missing'));
    }

    try {
      final response = await apiClient.postComplaint(
        token,
        id,
        complaintRequest,
      );

      return Right(response);
    } on DioException catch (e) {
      return Left(FailureResponse.fromJson(e.response?.data));
    }
  }
}
