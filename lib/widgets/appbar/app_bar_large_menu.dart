import 'package:flutter/material.dart';
import '../../common/extensions.dart';
import '../../conf/app_menu_list.dart';
import '../../theme/app_sizes.dart';
import '../../theme/app_text_styles.dart';

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
