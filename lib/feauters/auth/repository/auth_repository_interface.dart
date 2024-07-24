import 'package:dartz/dartz.dart';
import 'package:gde_namaz/api/models/models.dart';

abstract interface class AuthRepositoryInterface {
  Future<Either<FailureResponse, User>> createUser();

  Future<Either<FailureResponse, AuthResponse>> authByDevice();

  Future<Either<FailureResponse, User?>> authMe();
}
