import 'package:flutter/material.dart';
import 'package:gde_namaz/injection_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:gde_namaz/generated/codegen_loader.g.dart';

import 'app/gde_namaz_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await initDependencies();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ru', 'RU'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      assetLoader: const CodegenLoader(),
      child: const GdeNamazApp(),
    ),
  );
}
