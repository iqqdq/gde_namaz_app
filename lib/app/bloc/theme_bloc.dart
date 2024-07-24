import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gde_namaz/app/repository/theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeRepositoryInterface _themeRepositoryInterface;

  ThemeBloc({
    required ThemeRepositoryInterface themeRepositoryInterface,
  })  : _themeRepositoryInterface = themeRepositoryInterface,
        super(ThemeState(
            brightness: themeRepositoryInterface.isDarkThemeSelected()
                ? Brightness.dark
                : Brightness.light)) {
    on<ThemeEvent>((event, emit) async {
      final isDark = themeRepositoryInterface.isDarkThemeSelected();
      final now = DateTime.now().toLocal();
      final isNight = now.hour >= 6 && now.hour < 19 ? false : true;

      if (isDark != isNight) {
        await _themeRepositoryInterface.setDarkThemeSelected(enabled: isNight);
        emit(ThemeState(
            brightness: isNight ? Brightness.dark : Brightness.light));
      }
    });
  }
}
