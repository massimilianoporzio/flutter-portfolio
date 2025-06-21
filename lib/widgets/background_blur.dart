import 'package:flutter/material.dart';
import 'package:portfolio/common/extensions.dart';
import 'package:portfolio/theme/app_sizes.dart';

class BackgroundBlur extends StatelessWidget {
  const BackgroundBlur({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -(context.width / 4),
      top: -(context.width / 4) + Insets.xxxl,
      child: Container(
        width: context.width / 2,
        height: context.height / 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: context.theme.colorScheme.primary.withValues(alpha: 0.4),
              blurRadius: 200,
              spreadRadius: 100,
            ),
          ],
        ),
      ),
    );
  }
}
