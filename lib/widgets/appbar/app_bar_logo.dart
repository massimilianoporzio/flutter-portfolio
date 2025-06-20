import 'package:flutter/material.dart';
import '../../common/extensions.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(context.messages.title, style: context.textStyles.titleLgBold);
  }
}
