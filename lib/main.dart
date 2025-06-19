import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/common/providers/providers.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/pages/home_page.dart';
import 'package:portfolio/theme/app_theme.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //ascolto in TUTTA la app il cambio di lingua
    final locale = ref.watch(appLocaleControllerProvider);
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.title,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale(locale.value ?? 'en'), // Default locale inglese
      supportedLocales: const [
        Locale('en'), // English
        Locale('it'), // Italian
      ],
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      home: HomePage(),
    );
  }
}
