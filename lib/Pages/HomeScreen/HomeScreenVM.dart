import 'package:cookbook/Pages/HomeScreen/HomeScreenModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final homeScreenProvider =
    ChangeNotifierProvider(
      (ref) => HomeScreenVM()
        ..initialize(),
    );


class HomeScreenVM extends HomeScreenModel with ChangeNotifier {
  void initialize() {
    notifyListeners();
  }
}