import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:talker/talker.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:gde_namaz/generated/codegen_loader.g.dart';

import 'api/api.dart';
import 'app/gde_namaz_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();

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

  final mobileDeviceIdentifier = await MobileDeviceIdentifier().getDeviceId();

  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ru', 'RU'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        assetLoader: const CodegenLoader(),
        child: GdeNamazApp(
          apiClient: ApiClient(dio),
          sharedPreferences: sharedPreferences,
          mobileDeviceIdentifier: mobileDeviceIdentifier,
        )),
  );
}
