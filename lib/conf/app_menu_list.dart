import 'package:flutter/material.dart';
import '../common/extensions.dart';
import '../routes/app_routes.dart';

class AppeMenu {
  final String label;
  final String path;

  AppeMenu({
    required this.label,
    required this.path,
  });
}

class AppMenuList {
  static List<AppeMenu> getItems(BuildContext context) => [
    AppeMenu(
      label: context.messages.home,
      path: Routes.home,
    ),
    AppeMenu(
      label: context.messages.courses,
      path: Routes.courses,
    ),
    AppeMenu(
      label: context.messages.blog,
      path: Routes.blog,
    ),
    AppeMenu(
      label: context.messages.aboutMe,
      path: Routes.about,
    ),
  ];
}
