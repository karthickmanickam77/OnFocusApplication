import 'package:cookbook/Helpers/AppNavigations/NavigationHelpers.dart';
import 'package:cookbook/Pages/AppBlockingScreen/AppBlockingScreen.dart';
import 'package:cookbook/Pages/AppSelectionScreen/AppSelectionScreen.dart';
import 'package:cookbook/Pages/FocusModeWithTimer/FocusModeWithTimer.dart';
import 'package:cookbook/Pages/HomeScreen/HomeScreen.dart';
import 'package:cookbook/Pages/LoginScreen/LoginScreen.dart';
import 'package:cookbook/Pages/MainScreen/MainScreen.dart';
import 'package:cookbook/Pages/MoodScreen/MoodScreen.dart';
import 'package:cookbook/Pages/OnboardingScreen/OnboardingScreen.dart';
import 'package:cookbook/Pages/SignupScreen/SignupScreen.dart';
import 'package:cookbook/Pages/SplashScreen/SplashScreen.dart';

enum Routes {
  mainPage,
  homePage,
  focusModeWithTimerPage,
  moodScreenPage,
  splashscreenPage,
  appbBlockingScreenPage,
  appsSelectionPage,
  onBoardingScreenPage,
  loginScreenPage,
  signupScreenPage
}

class Pages {
  //! Data for Bottom Nav Config
  Object? data;

  //homePageScreen Config
  static final PageConfig mainPageConfig =
      PageConfig(route: Routes.mainPage, build: (_) => MainScreen());
  static final PageConfig onBoardingScreenConfig = PageConfig(
      route: Routes.onBoardingScreenPage, build: (_) => OnboardingScreen());
  static final PageConfig signupPageConfig =
      PageConfig(route: Routes.signupScreenPage, build: (_) => SignupScreen());
  static final PageConfig loginPageConfig =
      PageConfig(route: Routes.loginScreenPage, build: (_) => LoginScreen());
  static final PageConfig appBlockingPageConfig = PageConfig(
      route: Routes.appbBlockingScreenPage, build: (_) => AppBlockingScreen());
  static final PageConfig appsSelectionPageConfig = PageConfig(
      route: Routes.appbBlockingScreenPage, build: (_) => AppSelectionScreen());
  static final PageConfig homePageConfig =
      PageConfig(route: Routes.homePage, build: (_) => HomeScreen());
  static final PageConfig splashPageConfig =
      PageConfig(route: Routes.splashscreenPage, build: (_) => SplashScreen());
  static final PageConfig focusModeWithTimePageConfig = PageConfig(
      route: Routes.focusModeWithTimerPage, build: (_) => FocusModeWithTimer());

  static final PageConfig moodScreenPageConfig =
      PageConfig(route: Routes.moodScreenPage, build: (_) => MoodScreen());
}
