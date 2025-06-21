import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:seo/seo.dart';

import 'package:url_strategy/url_strategy.dart';
import 'features/theme/presentation/cubit/theme_cubit.dart';
import 'features/lang/presentation/cubit/lang_cubit.dart';
import 'l10n/app_localizations.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory(
            (await getApplicationDocumentsDirectory()).path,
          ),
  );
  runApp(
    ProviderScope(
      child: MainApp(),
    ),
  ); //uso anche riverpod
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext contextf) {
    //ascolto in TUTTA la app il cambio di lingua

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LangCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],

      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return BlocBuilder<LangCubit, LangState>(
            builder: (context, state) {
              ThemeMode themeMode = themeState is ThemeChanged
                  ? themeState.themeMode
                  : (themeState as ThemeInitial).themeMode;
              return SeoController(
                enabled: true,
                tree: WidgetTree(context: context),
                child: MaterialApp(
                  onGenerateTitle: (context) =>
                      AppLocalizations.of(context)!.title,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  locale: Locale(state.locale),
                  supportedLocales: const [
                    Locale('en'), // English
                    Locale('it'), // Italian
                  ],
                  darkTheme: state.locale == 'en'
                      ? AppTheme(fontFamily: 'PlayFair').dark
                      : AppTheme(fontFamily: 'PlayFair').dark,
                  theme: state.locale == 'en'
                      ? AppTheme(fontFamily: 'PlayFair').light
                      : AppTheme(fontFamily: 'PlayFair').light,
                  themeMode: themeMode,
                  home: HomePage(),
                  //navigatorObservers: [seoRouteObserver],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
