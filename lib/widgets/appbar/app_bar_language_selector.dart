import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../common/extensions.dart';
import '../../conf/app_icons.dart';

import '../../features/lang/presentation/cubit/lang_cubit.dart';
import '../seo_text.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext contextf) {
    return BlocBuilder<LangCubit, LangState>(
      builder: (context, state) {
        return PopupMenuButton(
          initialValue: state.locale,
          onSelected: (value) {
            // Change the locale in the LangCubit
            context.read<LangCubit>().changeLocale(value);
          },
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
          child: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.language,
                  color: context.colorScheme.onSurface,
                ),
                const Gap(2),
                SEOText(
                  state.locale == 'en' ? 'En' : 'It',
                ),
              ],
            ),
          ),
        );
      },
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
