import 'package:gde_namaz/app/repository/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepository implements ThemeRepositoryInterface {
  ThemeRepository({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;
  static const _isDarkThemeSelectedKey = 'dark_theme_selected';

  @override
  bool isDarkThemeSelected() {
    final selected = sharedPreferences.getBool(_isDarkThemeSelectedKey);
    return selected ?? false;
  }

  @override
  Future setDarkThemeSelected({required bool enabled}) async {
    await sharedPreferences.setBool(
      _isDarkThemeSelectedKey,
      enabled,
    );
  }
}
