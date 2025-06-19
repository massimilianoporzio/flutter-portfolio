import 'package:shared_preferences/shared_preferences.dart';

class AppSahredPrefs {
  static const localeKey = 'app_locale';
  static Future<void> setAppLocale(String locale) async {
    // Implementa la logica per salvare la lingua preferita
    // ad esempio, usando SharedPreferences
    final sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString(localeKey, locale);
  }

  static Future<String> getAppLocale() async {
    // Implementa la logica per recuperare la lingua preferita
    // ad esempio, usando SharedPreferences
    final sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString(localeKey) ??
        'en'; // Ritorna 'en' se non è impostata
  }
}
