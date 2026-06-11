import 'package:flutter/material.dart';
import 'package:cookbook/Helpers/Language_Localization/app_localizations.dart';

import '../Enums/MoodType.dart';

extension MoodTypeExtension on MoodType {
  String title(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    switch (this) {
      case MoodType.happy:
        return lang.happy;

      case MoodType.calm:
        return lang.calm;

      case MoodType.focused:
        return lang.focused;

      case MoodType.relaxed:
        return lang.relaxed;

      case MoodType.excited:
        return lang.excited;

      case MoodType.sad:
        return lang.sad;

      case MoodType.stressed:
        return lang.stressed;

      case MoodType.motivated:
        return lang.motivated;

      case MoodType.sleepy:
        return lang.sleepy;

      case MoodType.energetic:
        return lang.energetic;

      case MoodType.anxious:
        return lang.anxious;

      case MoodType.creative:
        return lang.creative;
    }
  }
}
