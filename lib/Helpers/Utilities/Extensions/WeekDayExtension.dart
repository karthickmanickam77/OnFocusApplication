import 'package:cookbook/Helpers/Utilities/Enums/WeekDay.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/Helpers/Language_Localization/app_localizations.dart';

extension WeekDayExtension on WeekDay {
  String short(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    switch (this) {
      case WeekDay.monday:
        return lang.mondaySingle;

      case WeekDay.tuesday:
        return lang.tuesdaySingle;

      case WeekDay.wednesday:
        return lang.wednesdaySingle;

      case WeekDay.thursday:
        return lang.thursdaySingle;

      case WeekDay.friday:
        return lang.fridaySingle;

      case WeekDay.saturday:
        return lang.saturdaySingle;

      case WeekDay.sunday:
        return lang.sundaySingle;
    }
  }
}
