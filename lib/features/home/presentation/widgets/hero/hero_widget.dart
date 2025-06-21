import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/common/extensions.dart';
import 'package:portfolio/features/home/presentation/widgets/hero/hero_small_buttons.dart';
import 'package:portfolio/features/home/presentation/widgets/hero/hero_texts.dart';
import 'package:portfolio/theme/app_sizes.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Flutter'),
        context.isDesktop || context.isMobile ? _LargeHero() : _SmallHero(),
      ],
    );
  }
}

class _SmallHero extends StatelessWidget {
  const _SmallHero();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 140,
            maxHeight: 100,
          ),
        ),
        Gap(Insets.xl),
        HeroTexts(),
        Gap(Insets.xxl),
        HeroSmallButtons(),
      ],
    );
  }
}

class _LargeHero extends StatelessWidget {
  const _LargeHero();

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'hero-large',
      child: Image.asset(
        'assets/images/flutter_logo.png',
        width: 200,
        height: 200,
      ),
    );
  }
}
