import 'package:cookbook/BOs/CustomBottomNavElement/BottomNavElementBO.dart';

class MainScreenModel {

  List<BottomNavElementBO> elements = [];

  int currentIndex = 0;

  void setBottomBarElements(
    List<BottomNavElementBO> value,
  ) {
 
    elements = value;
  }

  void setCurrentIndex(int value) {

    currentIndex = value;
  }
}