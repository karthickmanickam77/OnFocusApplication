import 'package:cookbook/BOs/MoodBO/MoodBO.dart';
import 'package:cookbook/Helpers/AppNavigations/NavigationConfig.dart';
import 'package:cookbook/Helpers/AppNavigations/NavigationHelpers.dart';
import 'package:cookbook/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:cookbook/Helpers/Utilities/Enums/MoodType.dart';
import 'package:cookbook/Pages/MoodScreen/MoodScreenModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moodscreenprovider =
    ChangeNotifierProvider.autoDispose((ref) => MoodScreenVM());

class MoodScreenVM extends MoodScreenModel
    with ChangeNotifier, NavigationMixin {
  MoodScreenVM() {
    initiallize();
  }
  void initiallize() {
    setMoodList([
      MoodBO(
        mood: MoodType.happy,
        innergradientcolors: [
          Color(0xFFFFD36E),
          Color(0xFFFFB86C),
        ],
        outergradientcolors: [
          Color(0xFFFFF0C9),
          Color(0xFFFFE0B2),
        ],
      ),
      MoodBO(
        mood: MoodType.calm,
        innergradientcolors: [
          Color(0xFF89C2FF),
          Color(0xFF6FB7FF),
        ],
        outergradientcolors: [
          Color(0xFFDCEEFF),
          Color(0xFFCBE4FF),
        ],
      ),
      MoodBO(
        mood: MoodType.focused,
        innergradientcolors: [
          Color(0xFF8B7CFF),
          Color(0xFF6F61F6),
        ],
        outergradientcolors: [
          Color(0xFFE7E3FF),
          Color(0xFFD8D1FF),
        ],
      ),
      MoodBO(
        mood: MoodType.relaxed,
        innergradientcolors: [
          Color(0xFF6ED7C8),
          Color(0xFF56C8B8),
        ],
        outergradientcolors: [
          Color(0xFFDDF8F3),
          Color(0xFFC9F1E8),
        ],
      ),
      MoodBO(
        mood: MoodType.excited,
        innergradientcolors: [
          Color(0xFFFF9B7A),
          Color(0xFFFF7F6A),
        ],
        outergradientcolors: [
          Color(0xFFFFE5DD),
          Color(0xFFFFD4C7),
        ],
      ),
      MoodBO(
        mood: MoodType.sad,
        innergradientcolors: [
          Color(0xFF7E8CE0),
          Color(0xFF6978D6),
        ],
        outergradientcolors: [
          Color(0xFFE5E9FF),
          Color(0xFFD7DEFF),
        ],
      ),
      MoodBO(
        mood: MoodType.stressed,
        innergradientcolors: [
          Color(0xFFFF8C8C),
          Color(0xFFFF7272),
        ],
        outergradientcolors: [
          Color(0xFFFFE2E2),
          Color(0xFFFFD1D1),
        ],
      ),
      MoodBO(
        mood: MoodType.motivated,
        innergradientcolors: [
          Color(0xFFB38CFF),
          Color(0xFF9B72FF),
        ],
        outergradientcolors: [
          Color(0xFFF0E7FF),
          Color(0xFFE2D6FF),
        ],
      ),
      MoodBO(
        mood: MoodType.sleepy,
        innergradientcolors: [
          Color(0xFF9AA8B5),
          Color(0xFF7F8D99),
        ],
        outergradientcolors: [
          Color(0xFFEAEFF3),
          Color(0xFFDCE4EA),
        ],
      ),
      MoodBO(
        mood: MoodType.energetic,
        innergradientcolors: [
          Color(0xFFFF77AA),
          Color(0xFFFF5E94),
        ],
        outergradientcolors: [
          Color(0xFFFFE1EC),
          Color(0xFFFFD0E0),
        ],
      ),
      MoodBO(
        mood: MoodType.anxious,
        innergradientcolors: [
          Color(0xFFFFBE6B),
          Color(0xFFFFA94F),
        ],
        outergradientcolors: [
          Color(0xFFFFF0D8),
          Color(0xFFFFE4BF),
        ],
      ),
      MoodBO(
        mood: MoodType.creative,
        innergradientcolors: [
          Color(0xFF73DDE8),
          Color(0xFF57CBD8),
        ],
        outergradientcolors: [
          Color(0xFFDDF8FB),
          Color(0xFFC9F0F5),
        ],
      ),
    ]);
  }

  void navigationPop() {
    addNavigationToStream(navigate: NavigatorPop(data: null));
  }

  Future<void> navigationDecider() async {
    await sharedPreferenceService.setMoodSelected(true);
    addNavigationToStream(
        navigate:
            NavigatorPush(pageConfig: Pages.splashPageConfig, data: null));
  }

  @override
  void dispose() {
    disposeNavigationMixin();
    super.dispose();
  }
}
