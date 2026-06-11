import 'package:flutter/material.dart';

class LocaleUtils {
  static Locale currentLocale(BuildContext context) {
    return Localizations.localeOf(context);
  }

  static bool isGerman(BuildContext context) {
    return currentLocale(context).languageCode == 'de';
  }

  static bool isEnglish(BuildContext context) {
    return currentLocale(context).languageCode == 'en';
  }

  static bool isTamil(BuildContext context) {
    return currentLocale(context).languageCode == 'ta';
  }
}
