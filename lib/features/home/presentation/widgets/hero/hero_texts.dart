import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/common/extensions.dart';
import 'package:portfolio/theme/app_sizes.dart';
import 'package:portfolio/widgets/seo_text.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';

class HeroTexts extends StatelessWidget {
  const HeroTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: context.isDesktopOrTablet
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        SEOText(
          "Massimiliano",
          textAlign: context.isDesktopOrTablet
              ? TextAlign.left
              : TextAlign.center,
          style: context.textStyles.titleLgBold.copyWith(
            color: context.colorScheme.onBackground,
          ),
          textRendererStyle: TextRendererStyle.header1,
        ),
        Gap(Insets.sm),
        SEOText(
          "mobileAppDeveloper",
          textAlign: context.isDesktopOrTablet
              ? TextAlign.left
              : TextAlign.center,
          style: context.textStyles.titleMdMedium.copyWith(
            color: context.colorScheme.onBackground,
          ),
          textRendererStyle: TextRendererStyle.header2,
        ),
        Gap(Insets.lg),
        SEOText(
          "I build beautiful and performant mobile applications with Flutter.",
          textAlign: context.isDesktopOrTablet
              ? TextAlign.left
              : TextAlign.center,
          style: context.textStyles.bodyMdMedium.copyWith(
            color: context.colorScheme.onSurface,
          ),
          textRendererStyle: TextRendererStyle.header3,
        ),
      ],
    );
  }
}
