import 'package:cookbook/Helpers/Utilities/Enums/InsightsFilter.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/Helpers/Language_Localization/app_localizations.dart';

extension InsightFilterExtension on InsightFilter {
  String title(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    switch (this) {
      case InsightFilter.today:
        return lang.today;

      case InsightFilter.thisWeek:
        return lang.thisWeek;

      case InsightFilter.thisMonth:
        return lang.thisWeek;
    }
  }
}
