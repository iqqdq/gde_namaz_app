import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gde_namaz/api/api.dart';
import 'package:gde_namaz/api/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth.dart';

class AuthRepository implements AuthRepositoryInterface {
  AuthRepository({
    required this.mobileDeviceIdentifier,
    required this.apiClient,
    required this.sharedPreferences,
  });

  final String? mobileDeviceIdentifier;
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  @override
  Future<Either<FailureResponse, User>> createUser() async {
    if (mobileDeviceIdentifier == null) {
      return Left(FailureResponse(message: 'Unable to get device id'));
    }

    try {
      final response = await apiClient
          .postUser(AuthRequest(deviceId: mobileDeviceIdentifier!));

      await sharedPreferences.setString(
        'user',
        jsonEncode(response),
      );

      return Right(response);
    } on DioException catch (e) {
      return Left(FailureResponse.fromJson(e.response?.data));
    }
  }

  @override
  Future<Either<FailureResponse, AuthResponse>> authByDevice() async {
    if (mobileDeviceIdentifier == null) {
      return Left(FailureResponse(message: 'Unable to get device id'));
    }

    try {
      final response = await apiClient
          .authByDevice(AuthRequest(deviceId: mobileDeviceIdentifier!));

      await sharedPreferences.setString(
        'token',
        response.token,
      );

      return Right(response);
    } on DioException catch (e) {
      return Left(FailureResponse.fromJson(e.response?.data));
    }
  }

  @override
  Future<Either<FailureResponse, User?>> authMe() async {
    String? token = sharedPreferences.getString('token');
    if (token == null) {
      return Left(FailureResponse(message: 'Token is missing'));
    }

    try {
      final response = await apiClient.authMe(token);

      await sharedPreferences.setString(
        'user',
        jsonEncode(response),
      );

      return Right(response);
    } on DioException catch (e) {
      return Left(FailureResponse.fromJson(e.response?.data));
    }
  }
}
