import 'package:flutter/material.dart';
import 'package:portfolio/common/extensions.dart';
import 'package:portfolio/conf/app_menu_list.dart';

import 'package:portfolio/theme/app_sizes.dart';
import 'package:portfolio/theme/app_text_styles.dart';
import 'package:portfolio/widgets/appbar/app_bar_drawer_icon.dart';

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

class LargeMenu extends StatelessWidget {
  const LargeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: AppMenuList.getItems(context).map((item) {
        return LargeAppBarMenuItem(
          label: item.label,
          isSelected: true,
        );
      }).toList(),
    );
  }
}

class LargeAppBarMenuItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;
  const LargeAppBarMenuItem({
    super.key,
    required this.label,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Insets.md,
          vertical: Insets.xs,
        ),
        child: Text(
          label,
          style: SmallTextStyles().bodyLgMedium.copyWith(
            color: isSelected ? context.theme.colorScheme.onSurface : null,
          ),
        ),
      ),
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
