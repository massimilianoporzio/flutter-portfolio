import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  void changeTheme(ThemeMode themeMode) {
    emit(ThemeChanged(themeMode));
  }

  ThemeMode get currentTheme => state is ThemeChanged
      ? (state as ThemeChanged).themeMode
      : (state as ThemeInitial).themeMode;

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeChanged(
      json['themeMode'] == 'ThemeMode.dark' ? ThemeMode.dark : ThemeMode.light,
    );
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return {
      'themeMode': state is ThemeChanged
          ? state.themeMode.toString()
          : (state as ThemeInitial).themeMode.toString(),
    };
  }
}
