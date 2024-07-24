part of 'theme_bloc.dart';

final class ThemeState extends Equatable {
  const ThemeState({required this.brightness});

  final Brightness brightness;

  bool get isDark => brightness == Brightness.dark;

  @override
  List<Object> get props => [brightness];
}

final class ThemeMapState extends ThemeState {
  const ThemeMapState({
    required this.mapStyle,
    required super.brightness,
  });

  final String mapStyle;

  @override
  List<Object> get props => [mapStyle];
}
