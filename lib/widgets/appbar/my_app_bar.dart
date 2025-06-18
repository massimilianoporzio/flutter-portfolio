import 'package:flutter/material.dart';
import 'package:portfolio/common/extensions.dart';

import 'package:portfolio/theme/app_sizes.dart';
import 'package:portfolio/widgets/appbar/app_bar_drawer_icon.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      alignment: Alignment.center,
      color: Colors.red,
      height: context.insets.appBarHeight,
      padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: Insets.maxWidth),
        child: Row(
          children: [
            AppLogo(),
            Spacer(),
            if (context.isDesktop) AppMenus(),
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

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          const PopupMenuItem(value: 'en', child: Text('English')),
          const PopupMenuItem(value: 'it', child: Text('Italiano')),
          // const PopupMenuItem(value: 'es', child: Text('Español')),
        ];
      },
    );
  }
}

class AppMenus extends StatelessWidget {
  const AppMenus({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(context.messages.home),
        Text(context.messages.courses),
        Text(context.messages.blog),
        Text(context.messages.aboutMe),
      ],
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(context.messages.title, style: context.textStyles.titleLgBold);
  }
}
