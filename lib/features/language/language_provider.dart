import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/language/app_locale_controller.dart';

final languageProvider = AsyncNotifierProvider<AppLocaleController, String>(
  AppLocaleController.new,
);
