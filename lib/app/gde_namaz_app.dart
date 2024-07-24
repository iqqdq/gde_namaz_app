import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:gde_namaz/router/router.dart';
import 'package:gde_namaz/api/api.dart';
import 'package:gde_namaz/ui/ui.dart';
import 'package:gde_namaz/app/app.dart';
import 'package:gde_namaz/feauters/auth/auth.dart';
import 'package:gde_namaz/feauters/map/map.dart';
import 'package:gde_namaz/feauters/venue/venue.dart';
import 'package:gde_namaz/feauters/create_venue/create_venue.dart';

class GdeNamazApp extends StatefulWidget {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  final String? mobileDeviceIdentifier;

  const GdeNamazApp({
    super.key,
    required this.apiClient,
    required this.sharedPreferences,
    required this.mobileDeviceIdentifier,
  });

  @override
  State<GdeNamazApp> createState() => _GdeNamazAppState();
}

class _GdeNamazAppState extends State<GdeNamazApp> {
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    final themeRepository =
        ThemeRepository(sharedPreferences: widget.sharedPreferences);

    final authRepository = AuthRepository(
      mobileDeviceIdentifier: widget.mobileDeviceIdentifier,
      apiClient: widget.apiClient,
      sharedPreferences: widget.sharedPreferences,
    );

    final mapRepository = MapRepository(apiClient: widget.apiClient);

    final venueRepository = VenueRepository(
      apiClient: widget.apiClient,
      sharedPreferences: widget.sharedPreferences,
    );

    final createVenueRepository = CreateVenueRepository(
      apiClient: widget.apiClient,
      sharedPreferences: widget.sharedPreferences,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ThemeBloc(themeRepositoryInterface: themeRepository),
        ),
        BlocProvider(
            create: (context) => AuthBloc(
                  authRepositoryInterface: authRepository,
                )),
        BlocProvider(
            create: (context) =>
                MapBloc(mapRepositoryInterface: mapRepository)),
        BlocProvider(
            create: (context) =>
                VenueBloc(venueRepositoryInterface: venueRepository)),
        BlocProvider(
            create: (context) => CreateVenueBloc(
                createVenueRepositoryInterface: createVenueRepository)),
      ],
      child: OKToast(
        child: BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
          return MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: state.isDark ? darkTheme : lightTheme,
            routerConfig: appRouter.config(),
          );
        }),
      ),
    );
  }
}
