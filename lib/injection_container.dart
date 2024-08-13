import 'package:dio/dio.dart';
import 'package:gde_namaz/api/api.dart';
import 'package:gde_namaz/app/app.dart';
import 'package:gde_namaz/feauters/auth/auth.dart';
import 'package:gde_namaz/feauters/create_venue/create_venue.dart';
import 'package:gde_namaz/feauters/map/map.dart';
import 'package:gde_namaz/feauters/venue/venue.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:talker/talker.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  final mobileDeviceIdentifier = await MobileDeviceIdentifier().getDeviceId();
  final sharedPreferences = await SharedPreferences.getInstance();
  final apiClient = initApiClient();

  sl.registerLazySingleton<ThemeRepositoryInterface>(
      () => ThemeRepository(sharedPreferences: sharedPreferences));

  sl.registerLazySingleton<AuthRepositoryInterface>(() => AuthRepository(
        mobileDeviceIdentifier: mobileDeviceIdentifier,
        apiClient: apiClient,
        sharedPreferences: sharedPreferences,
      ));

  sl.registerLazySingleton<MapRepositoryInterface>(
      () => MapRepository(apiClient: apiClient));

  sl.registerLazySingleton<VenueRepositoryInterface>(() => VenueRepository(
        apiClient: apiClient,
        sharedPreferences: sharedPreferences,
      ));

  sl.registerLazySingleton<CreateVenueRepositoryInterface>(
      () => CreateVenueRepository(
            apiClient: apiClient,
            sharedPreferences: sharedPreferences,
          ));
}

ApiClient initApiClient() {
  final dio = Dio();
  dio.interceptors.add(
    TalkerDioLogger(
      settings: TalkerDioLoggerSettings(
        printRequestHeaders: true,
        printRequestData: false,
        printResponseHeaders: false,
        printResponseMessage: true,
        printResponseData: true,
        requestPen: AnsiPen()..blue(),
        responsePen: AnsiPen()..green(),
        errorPen: AnsiPen()..red(),
      ),
    ),
  );

  return ApiClient(dio);
}
