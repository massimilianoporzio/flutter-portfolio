import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../features/theme/presentation/cubit/theme_cubit.dart';
import '../../theme/app_colors.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeCubit>().currentTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: FlutterSwitch(
        value: themeMode == ThemeMode.dark,

        //width: 65,
        //height: 35.0,
        //toggleSize: 25.0,
        activeToggleColor: Color(0xFF6E40C9),
        inactiveToggleColor: AppColors.gray[800]!,
        activeSwitchBorder: Border.all(
          color: AppColors.primaryColor,
          width: 6.0,
        ),
        inactiveSwitchBorder: Border.all(
          color: Color(0xFFD1D5DA),
          width: 6.0,
        ),
        activeColor: Color(0xFF271052),
        inactiveColor: Colors.white,
        activeIcon: Icon(
          Icons.nightlight_round,
          color: Color(0xFFF8E3A1),
        ),
        inactiveIcon: Icon(
          Icons.wb_sunny,
          color: Color(0xFFFFDF5D),
        ),
        onToggle: (value) {
          print('Theme changed to: ${value ? 'Dark' : 'Light'}');
          context.read<ThemeCubit>().changeTheme(
            value ? ThemeMode.dark : ThemeMode.light,
          );
        },
      ),
    );
  }
}
