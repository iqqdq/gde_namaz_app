import 'package:dartz/dartz.dart';
import 'package:gde_namaz/api/models/models.dart';

abstract interface class MapRepositoryInterface {
  Future<Either<FailureResponse, List<MapPoint>>> getMapPoints();
}
