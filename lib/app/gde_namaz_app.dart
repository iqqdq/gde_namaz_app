import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gde_namaz/injection_container.dart';
import 'package:oktoast/oktoast.dart';

import 'package:gde_namaz/router/router.dart';
import 'package:gde_namaz/ui/ui.dart';
import 'package:gde_namaz/app/app.dart';
import 'package:gde_namaz/feauters/auth/auth.dart';
import 'package:gde_namaz/feauters/map/map.dart';
import 'package:gde_namaz/feauters/venue/venue.dart';
import 'package:gde_namaz/feauters/create_venue/create_venue.dart';

class GdeNamazApp extends StatefulWidget {
  const GdeNamazApp({super.key});

  @override
  State<GdeNamazApp> createState() => _GdeNamazAppState();
}

class _GdeNamazAppState extends State<GdeNamazApp> {
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => ThemeBloc(
                themeRepositoryInterface: sl<ThemeRepositoryInterface>())),
        BlocProvider(
            create: (context) => AuthBloc(
                  authRepositoryInterface: sl<AuthRepositoryInterface>(),
                )),
        BlocProvider(
            create: (context) =>
                MapBloc(mapRepositoryInterface: sl<MapRepositoryInterface>())),
        BlocProvider(
            create: (context) => VenueBloc(
                venueRepositoryInterface: sl<VenueRepositoryInterface>())),
        BlocProvider(
            create: (context) => CreateVenueBloc(
                createVenueRepositoryInterface:
                    sl<CreateVenueRepositoryInterface>())),
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
