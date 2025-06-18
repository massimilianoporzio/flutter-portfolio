import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/common/extensions.dart';
import 'package:portfolio/conf/app_icons.dart';
import 'package:portfolio/widgets/seo_text.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            value: 'en',
            child: PopupLanguageItem(
              language: 'English',
              icon: AppIcons.uk,
            ),
          ),
          const PopupMenuItem(
            value: 'it',
            child: PopupLanguageItem(
              language: 'Italiano',
              icon: AppIcons.it,
            ),
          ),
        ];
      },
      child: Row(
        children: [
          Icon(
            Icons.language,
            color: context.colorScheme.onSurface,
          ),
          const Gap(4),
          SEOText(
            Localizations.localeOf(context).languageCode == 'en' ? 'En' : 'It',
          ),
        ],
      ),
    );
  }
}

class PopupLanguageItem extends StatelessWidget {
  final String language;
  final String icon;
  const PopupLanguageItem({
    super.key,
    required this.language,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset(
          icon,
          width: 18,
          height: 18,
        ),
        const Gap(6),
        SEOText(language),
      ],
    );
  }
}
