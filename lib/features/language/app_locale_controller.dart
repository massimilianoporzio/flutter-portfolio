import 'package:portfolio/shared/app_sahred_prefs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_locale_controller.g.dart';

@riverpod
class AppLocaleController extends _$AppLocaleController {
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
