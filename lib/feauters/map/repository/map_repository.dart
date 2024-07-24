import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gde_namaz/api/api.dart';
import 'package:gde_namaz/api/models/models.dart';

import 'map.dart';

class MapRepository implements MapRepositoryInterface {
  MapRepository({required this.apiClient});

  final ApiClient apiClient;

  @override
  Future<Either<FailureResponse, List<MapPoint>>> getMapPoints() async {
    try {
      final response = await apiClient.map();
      return Right(response);
    } on DioException catch (e) {
      return Left(FailureResponse.fromJson(e.response?.data));
    }
  }
}
