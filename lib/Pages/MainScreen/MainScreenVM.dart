import 'package:cookbook/BOs/CustomBottomNavElement/BottomNavElementBO.dart';
import 'package:cookbook/Pages/MainScreen/MainScreenModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mainScreenProvider = ChangeNotifierProvider<MainScreenVM>(
  (ref) {
    return MainScreenVM()..initialize();
  },
);

class MainScreenVM extends MainScreenModel with ChangeNotifier {
  void initialize() {
    setBottomBarElements([
      BottomNavElementBO(
        image: "lib/Helpers/Images/HomeIcon.png",
        name: "Home",
      ),
      BottomNavElementBO(
        image: "lib/Helpers/Images/InsightsIcon.png",
        name: "Insights",
      ),
      BottomNavElementBO(
        image: "lib/Helpers/Images/FocusIcon.png",
        name: "Focus Mode",
      ),
      BottomNavElementBO(
        image: "lib/Helpers/Images/profile.png",
        name: "Profile",
      ),
    ]);
    notifyListeners();
  }

  void changeIndex(int index) {
    setCurrentIndex(index);
    notifyListeners();
  }

  int getCurrentIndex() {
    notifyListeners();
    return currentIndex;
  }
}
