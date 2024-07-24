abstract class ThemeRepositoryInterface {
  bool isDarkThemeSelected();

  Future setDarkThemeSelected({required bool enabled});
}
