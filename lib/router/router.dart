import 'package:auto_route/auto_route.dart';
import 'package:gde_namaz/feauters/auth/view/view.dart';
import 'package:gde_namaz/feauters/map/view/view.dart';
import 'package:gde_namaz/feauters/settings/view/view.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthRoute.page,
          initial: true,
        ),
        AutoRoute(page: MapRoute.page),
        AutoRoute(page: SettingRoute.page),
      ];
}
