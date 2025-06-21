import 'package:flutter/material.dart';
import 'package:portfolio/common/extensions.dart';
import 'package:portfolio/conf/app_menu_list.dart';
import 'package:portfolio/theme/app_sizes.dart';
import 'package:portfolio/theme/app_text_styles.dart';

class SmallMenu extends StatelessWidget {
  const SmallMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: AppMenuList.getItems(context).map((item) {
        return DrawerSmallMenuItem(
          label: item.label,
          isSelected: true,
        );
      }).toList(),
    );
  }
}

class DrawerSmallMenuItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;
  const DrawerSmallMenuItem({
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
