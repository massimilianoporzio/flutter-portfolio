import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppLogo(),
        Spacer(),
        AppMenus(),
        Spacer(),
        LanguageSelector(),
        ThemeToggle(),
      ],
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
          const PopupMenuItem(value: 'es', child: Text('Español')),
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
        const Text('Home'),
        const Text('Courses'),
        const Text('Blog'),
        const Text('About Me'),
      ],
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Portofolio Logo');
  }
}
