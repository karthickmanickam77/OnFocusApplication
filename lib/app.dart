// ignore_for_file: prefer_const_constructors

import 'package:cookbook/Helpers/AppNavigations/NavigationConfig.dart';
import 'package:cookbook/Helpers/AppNavigations/NavigationHelpers.dart';
import 'package:cookbook/Pages/MainScreen/MainScreen.dart';
// import 'package:cookbook/Pages/LoginScreen/LoginScreen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: resolveRoute(Routes.mainPage),
      onGenerateRoute: AppRoute(
        initialPage: Pages.mainPageConfig,
        initialPageData: null,
      ).onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
