// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class ThemeInitial extends ThemeState {
  final ThemeMode themeMode;

  const ThemeInitial({this.themeMode = ThemeMode.dark});

  ThemeChanged copyWith({
    ThemeMode? themeMode,
  }) {
    return ThemeChanged(
      themeMode ?? this.themeMode,
    );
  }
}

class ThemeChanged extends ThemeState {
  final ThemeMode themeMode;

  const ThemeChanged(this.themeMode);

  @override
  List<Object> get props => [themeMode];

  ThemeChanged copyWith({
    ThemeMode? themeMode,
  }) {
    return ThemeChanged(
      themeMode ?? this.themeMode,
    );
  }
}
