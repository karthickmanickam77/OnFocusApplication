// ignore_for_file: prefer_const_constructors

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
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
