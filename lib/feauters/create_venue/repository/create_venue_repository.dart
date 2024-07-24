import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gde_namaz/api/api.dart';
import 'package:gde_namaz/api/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'create_venue.dart';

class CreateVenueRepository implements CreateVenueRepositoryInterface {
  CreateVenueRepository({
    required this.apiClient,
    required this.sharedPreferences,
  });

  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  @override
  Future<Either<FailureResponse, Venue>> createVenue(
      {required VenueRequest? venueRequest}) async {
    String? token = sharedPreferences.getString('token');

    if (token == null) {
      return Left(FailureResponse(message: 'Token is missing'));
    }

    try {
      final response = await apiClient.postVenue(
        token,
        venueRequest,
      );

      return Right(response);
    } on DioException catch (e) {
      return Left(FailureResponse.fromJson(e.response?.data));
    }
  }
}
