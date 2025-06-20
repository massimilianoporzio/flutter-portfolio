// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/theme/app_sizes.dart';

class AppTheme {
  final String fontFamily;
  AppTheme({
    required this.fontFamily,
  });

  ThemeData _getThemeData({
    required ColorScheme colorScheme,
    required Color scaffoldBackgroundColor,
    required AppBarTheme appBarTheme,
    required WidgetStateProperty<TextStyle> elevatedButtonTextStyle,
    required WidgetStateProperty<TextStyle> outlinedButtonTextStyle,
  }) {
    print("CIAO");
    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      fontFamily: fontFamily,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarTheme: appBarTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          fixedSize: const WidgetStatePropertyAll(Size.fromHeight(40)),
          backgroundColor: _primaryButtonStates,
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: Insets.xl, vertical: 10),
          ),
          textStyle: elevatedButtonTextStyle,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          fixedSize: const WidgetStatePropertyAll(Size.fromHeight(40)),
          side: _outlinedButtonStates,
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: Insets.xl, vertical: 10),
          ),
          textStyle: outlinedButtonTextStyle,
        ),
      ),
    );
  }

  ThemeData get dark => _getThemeData(
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryColor,
      background: AppColors.darkBackgroundColor,
      surface: AppColors.gray[800]!,
      outline: AppColors.gray[700]!,
      outlineVariant: AppColors.gray[600]!,
      onBackground: AppColors.gray[100]!,
      onSurface: AppColors.gray[100]!,
      onSurfaceVariant: AppColors.gray[200]!,
      tertiary: AppColors.gray[300]!,
    ),
    scaffoldBackgroundColor: AppColors.darkBackgroundColor,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.primaryColor),
    elevatedButtonTextStyle: _darkElevatedButtonTextStyle,
    outlinedButtonTextStyle: _darkOutlinedButtonTextStyle,
  );
  ThemeData get light => _getThemeData(
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      //background: AppColors.gray[100]!,
      surface: AppColors.gray[200]!,
      outline: AppColors.gray[300]!,
      outlineVariant: AppColors.gray[400]!,
      //onBackground: AppColors.gray[800]!,
      onSurface: AppColors.gray[700]!,
      onSurfaceVariant: AppColors.gray[600]!,
      tertiary: AppColors.gray[900]!,
    ),
    scaffoldBackgroundColor: AppColors.gray[100]!,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.gray[900]),
    elevatedButtonTextStyle: _lightElevatedButtonTextStyle,
    outlinedButtonTextStyle: _lightOutlinedButtonTextStyle,
  );

  final _primaryButtonStates = WidgetStateProperty.resolveWith(
    (states) {
      if (states.contains(WidgetState.hovered) ||
          states.contains(WidgetState.pressed)) {
        return AppColors.primaryColor.withValues(alpha: 0.7);
      }
      return AppColors.primaryColor;
    },
  );
  final _outlinedButtonStates = WidgetStateProperty.resolveWith(
    (states) {
      if (states.contains(WidgetState.hovered) ||
          states.contains(WidgetState.pressed)) {
        return BorderSide(color: AppColors.primaryColor.withValues(alpha: 0.7));
      }
      return BorderSide(color: AppColors.primaryColor);
    },
  );

  WidgetStateProperty<TextStyle> get _darkElevatedButtonTextStyle =>
      WidgetStatePropertyAll(
        TextStyle(
          color: AppColors.gray[100],
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
        ),
      );
  WidgetStateProperty<TextStyle> get _lightElevatedButtonTextStyle =>
      WidgetStatePropertyAll(
        TextStyle(
          color: AppColors.gray[100],
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
        ),
      );
  WidgetStateProperty<TextStyle> get _darkOutlinedButtonTextStyle =>
      WidgetStatePropertyAll(
        TextStyle(
          color: AppColors.gray[100],
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
        ),
      );
  WidgetStateProperty<TextStyle> get _lightOutlinedButtonTextStyle =>
      WidgetStatePropertyAll(
        TextStyle(
          color: AppColors.gray[100],
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
        ),
      );
}
