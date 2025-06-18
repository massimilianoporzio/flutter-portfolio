import 'package:flutter/material.dart';
import 'package:portfolio/common/extensions.dart';
import 'package:portfolio/theme/app_sizes.dart';
import 'package:portfolio/widgets/appbar/app_bar_drawer_icon.dart';
import 'package:portfolio/widgets/appbar/app_bar_language_selector.dart';
import 'package:portfolio/widgets/appbar/app_bar_large_menu.dart';
import 'package:portfolio/widgets/appbar/app_bar_logo.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      alignment: Alignment.center,
      color: context.theme.appBarTheme.backgroundColor,
      height: context.insets.appBarHeight,
      padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: Insets.maxWidth),
        child: Row(
          children: [
            AppLogo(),
            Spacer(),
            if (context.isDesktop) LargeMenu(),
            Spacer(),
            LanguageSelector(),
            ThemeToggle(),
            if (!context.isDesktop) AppBarDrawerIcon(),
          ],
        ),
      ),
    );
  }
}

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch(value: false, onChanged: (value) {});
  }
}
