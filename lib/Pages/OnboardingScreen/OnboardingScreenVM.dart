import 'package:cookbook/Helpers/AppNavigations/NavigationConfig.dart';
import 'package:cookbook/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:cookbook/Pages/OnboardingScreen/OnboardingScreenModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onboardingscreenprovider =
    ChangeNotifierProvider((ref) => OnboardingScreenVM());

class OnboardingScreenVM extends OnboardingScreenModel
    with ChangeNotifier, NavigationMixin {
  OnboardingScreenVM() {
    initialize();
  }
  void initialize() {}
  int getIndex() {
    int currentIndex = index;
    return currentIndex;
  }

  void updateIndex(int currentIndex) {
    setCurrentIndex(currentIndex);
    notifyListeners();
  }

  void navigateToNextScreen() {
    addNavigationToStream(
        navigate: NavigatorPopAndPush(pageConfig: Pages.mainPageConfig, data: Null));
  }
}
