import 'dart:async';

import 'package:cookbook/Helpers/AppNavigations/NavigationConfig.dart';
import 'package:cookbook/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:cookbook/Pages/SplashScreen/SplashScreenModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashscreenprovider =
    ChangeNotifierProvider.autoDispose((ref) => SplashScreenVM());

class SplashScreenVM extends SplashScreenModel
    with NavigationMixin, ChangeNotifier {
  SplashScreenVM() {
    initiallize();
  }
  void initiallize() {
    navigationDecider();
  }

  Future<void> navigationDecider() async {
    await Future.delayed(Duration(seconds: 3));
    if (await sharedPreferenceService.getMoodSelected()) {
      addNavigationToStream(
          navigate:
              NavigatorPush(pageConfig: Pages.mainPageConfig, data: null));
    } else {
      addNavigationToStream(
          navigate: NavigatorPopAndPush(
              pageConfig: Pages.moodScreenPageConfig, data: null));
    }
  }

  @override
  void dispose() {
    disposeNavigationMixin();
    super.dispose();
  }
}
