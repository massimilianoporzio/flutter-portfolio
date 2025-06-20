import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/theme/presentation/cubit/theme_cubit.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeCubit>().currentTheme;
    return Switch(
      value: themeMode == ThemeMode.dark,
      onChanged: (value) {
        print('Theme changed to: ${value ? 'Dark' : 'Light'}');
        context.read<ThemeCubit>().changeTheme(
          value ? ThemeMode.dark : ThemeMode.light,
        );
      },
    );
  }
}
