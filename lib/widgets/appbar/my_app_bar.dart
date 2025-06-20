import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/common/extensions.dart';
import 'package:portfolio/theme/app_sizes.dart';
import 'package:portfolio/widgets/appbar/app_bar_drawer_icon.dart';
import 'package:portfolio/widgets/appbar/app_bar_language_selector.dart';
import 'package:portfolio/widgets/appbar/app_bar_large_menu.dart';
import 'package:portfolio/widgets/appbar/app_bar_logo.dart';
import 'package:portfolio/widgets/appbar/app_bar_theme_switch.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppLogo(),
            Spacer(),
            if (context.isDesktop) LargeMenu(),
            if (context.isDesktop) Spacer(),
            LanguageSelector(),
            if (context.isDesktop) Gap(8),
            ThemeToggle(),
            if (!context.isDesktop) AppBarDrawerIcon(),
          ],
        ),
      ),
    );
  }
}
