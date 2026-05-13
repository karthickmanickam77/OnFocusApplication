import 'dart:async';

import 'package:cookbook/Helpers/AppNavigations/NavigationHelpers.dart';

mixin NavigationMixin {
  StreamController<INavigation> navigationStream = StreamController.broadcast();

  void addNavigationToStream({required INavigation navigate}) {
    navigationStream.add(navigate);
  }

  void disposeNavigationMixin() {
    navigationStream.close();
  }
}

//! Create Abstract Class INavigation for dispatching navigation event
abstract class INavigation {}

//! Create event Class for push
class NavigatorPush<T> extends INavigation {
  final PageConfig pageConfig;
  final T data;
  final bool checkMounted;
  NavigatorPush({
    required this.pageConfig,
    required this.data,
    this.checkMounted = true,
  });
}

//! Create event Class for pop
class NavigatorPop<T> extends INavigation {
  final T? data;
  final bool checkMounted;
  NavigatorPop({
    this.data,
    this.checkMounted = false,
  });
}

//! Create event Class for pushreplacement
class NavigatorPushReplace<T> extends INavigation {
  final PageConfig pageConfig;
  final T data;
  final bool checkMounted;
  NavigatorPushReplace({
    required this.pageConfig,
    required this.data,
    this.checkMounted = false,
  });
}

//! Create event Class for popAndPush
class NavigatorPopAndPush<T> extends INavigation {
  final PageConfig pageConfig;
  final T data;
  final bool checkMounted;
  NavigatorPopAndPush({
    required this.pageConfig,
    required this.data,
    this.checkMounted = false,
  });
}

//! Create event Class for pushAndRemoveUntil
class NavigatorPopAndRemoveUntil<T> extends INavigation {
  final PageConfig pageConfig;
  final PageConfig removeUntilpageConfig;
  final T data;
  final bool checkMounted;
  NavigatorPopAndRemoveUntil({
    required this.pageConfig,
    required this.removeUntilpageConfig,
    required this.data,
    this.checkMounted = false,
  });
}
