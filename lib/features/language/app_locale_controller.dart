import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/shared/app_sahred_prefs.dart';

class AppLocaleController extends AsyncNotifier<String> {
  @override
  FutureOr<String> build() {
    return AppSahredPrefs.getAppLocale();
  }

  void changeLocale(String newLocale) async {
    await AppSahredPrefs.setAppLocale(newLocale); //lo salvo in locale prima
    update((state) {
      return newLocale;
    });
  }
}
