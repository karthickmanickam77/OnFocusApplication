import 'package:cookbook/Helpers/Utilities/Enums/MoodType.dart';
import 'package:flutter/animation.dart';

class MoodBO {
  MoodType mood;
  List<Color> innergradientcolors;
  List<Color> outergradientcolors;
  MoodBO(
      {required this.mood,
      required this.innergradientcolors,
      required this.outergradientcolors});
}
