import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/pages/home_page.dart';
import 'package:portfolio/theme/app_theme.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.title,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('en'), // Default locale inglese
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
