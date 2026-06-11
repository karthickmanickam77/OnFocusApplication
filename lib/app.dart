// ignore_for_file: prefer_const_constructors

import 'package:cookbook/Helpers/AppNavigations/NavigationConfig.dart';
import 'package:cookbook/Helpers/AppNavigations/NavigationHelpers.dart';
import 'package:cookbook/Helpers/Language_Localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('de'),
      supportedLocales: const [Locale('en'), Locale('de'), Locale('ta')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      onGenerateRoute: AppRoute(
        initialPage: Pages.moodScreenPageConfig,
        initialPageData: "main",
      ).onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
