import 'package:cookbook/Helpers/AppNavigations/NavigationHelpers.dart';
import 'package:cookbook/Pages/FocusModeWithTimer/FocusModeWithTimer.dart';
import 'package:cookbook/Pages/HomeScreen/HomeScreen.dart';
import 'package:cookbook/Pages/MainScreen/MainScreen.dart';

enum Routes { mainPage, homePage, focusModeWithTimerPage }

class Pages {
  //! Data for Bottom Nav Config
  Object? data;

  //homePageScreen Config
  static final PageConfig mainPageConfig =
      PageConfig(route: Routes.mainPage, build: (_) => MainScreen());
  static final PageConfig homePageConfig =
      PageConfig(route: Routes.homePage, build: (_) => HomeScreen());

  static final PageConfig focusModeWithTimePageConfig = PageConfig(
      route: Routes.focusModeWithTimerPage, build: (_) => FocusModeWithTimer());
}
