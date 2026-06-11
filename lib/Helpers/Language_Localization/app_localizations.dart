import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_ta.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'Language_Localization/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('ta')
  ];

  /// No description provided for @goodMorning.
  ///
  /// In en, this message translates to:
  /// **'Good Morning'**
  String get goodMorning;

  /// No description provided for @focusScore.
  ///
  /// In en, this message translates to:
  /// **'Focus Score'**
  String get focusScore;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @focusedTime.
  ///
  /// In en, this message translates to:
  /// **'Focused Time'**
  String get focusedTime;

  /// No description provided for @distractedTime.
  ///
  /// In en, this message translates to:
  /// **'Distracted Time'**
  String get distractedTime;

  /// No description provided for @vsYesterday.
  ///
  /// In en, this message translates to:
  /// **'vs yesterday'**
  String get vsYesterday;

  /// No description provided for @inactiveFor.
  ///
  /// In en, this message translates to:
  /// **'You’ve been inactive'**
  String get inactiveFor;

  /// No description provided for @minutes15.
  ///
  /// In en, this message translates to:
  /// **'for 15 min'**
  String get minutes15;

  /// No description provided for @shortBreakQuestion.
  ///
  /// In en, this message translates to:
  /// **'Time for a short break?'**
  String get shortBreakQuestion;

  /// No description provided for @quickStart.
  ///
  /// In en, this message translates to:
  /// **'Quick Start'**
  String get quickStart;

  /// No description provided for @startFocus.
  ///
  /// In en, this message translates to:
  /// **'Start Focus'**
  String get startFocus;

  /// No description provided for @takeBreak.
  ///
  /// In en, this message translates to:
  /// **'Take a Break'**
  String get takeBreak;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @insights.
  ///
  /// In en, this message translates to:
  /// **'Insights'**
  String get insights;

  /// No description provided for @focusMode.
  ///
  /// In en, this message translates to:
  /// **'Focus Mode'**
  String get focusMode;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @focusVsDistraction.
  ///
  /// In en, this message translates to:
  /// **'Focus vs Distraction'**
  String get focusVsDistraction;

  /// No description provided for @topDistractionApps.
  ///
  /// In en, this message translates to:
  /// **'Top Distraction Apps'**
  String get topDistractionApps;

  /// No description provided for @totalTime.
  ///
  /// In en, this message translates to:
  /// **'Total Time'**
  String get totalTime;

  /// No description provided for @productiveHeatmap.
  ///
  /// In en, this message translates to:
  /// **'Productive Heatmap'**
  String get productiveHeatmap;

  /// No description provided for @thisWeek.
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get thisWeek;

  /// No description provided for @mondayShort.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get mondayShort;

  /// No description provided for @tuesdayShort.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get tuesdayShort;

  /// No description provided for @wednesdayShort.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get wednesdayShort;

  /// No description provided for @thursdayShort.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get thursdayShort;

  /// No description provided for @fridayShort.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get fridayShort;

  /// No description provided for @saturdayShort.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get saturdayShort;

  /// No description provided for @sundayShort.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get sundayShort;

  /// No description provided for @mondaySingle.
  ///
  /// In en, this message translates to:
  /// **'M'**
  String get mondaySingle;

  /// No description provided for @tuesdaySingle.
  ///
  /// In en, this message translates to:
  /// **'T'**
  String get tuesdaySingle;

  /// No description provided for @wednesdaySingle.
  ///
  /// In en, this message translates to:
  /// **'W'**
  String get wednesdaySingle;

  /// No description provided for @thursdaySingle.
  ///
  /// In en, this message translates to:
  /// **'T'**
  String get thursdaySingle;

  /// No description provided for @fridaySingle.
  ///
  /// In en, this message translates to:
  /// **'F'**
  String get fridaySingle;

  /// No description provided for @saturdaySingle.
  ///
  /// In en, this message translates to:
  /// **'S'**
  String get saturdaySingle;

  /// No description provided for @sundaySingle.
  ///
  /// In en, this message translates to:
  /// **'S'**
  String get sundaySingle;

  /// No description provided for @appBlocking.
  ///
  /// In en, this message translates to:
  /// **'App Blocking'**
  String get appBlocking;

  /// No description provided for @enableSmartBlocking.
  ///
  /// In en, this message translates to:
  /// **'Enable Smart Blocking'**
  String get enableSmartBlocking;

  /// No description provided for @addApp.
  ///
  /// In en, this message translates to:
  /// **'Add App'**
  String get addApp;

  /// No description provided for @blockingRules.
  ///
  /// In en, this message translates to:
  /// **'Blocking Rules'**
  String get blockingRules;

  /// No description provided for @blockDuringFocusHours.
  ///
  /// In en, this message translates to:
  /// **'Block during focus hours'**
  String get blockDuringFocusHours;

  /// No description provided for @dailyUsageLimit.
  ///
  /// In en, this message translates to:
  /// **'Daily usage limit'**
  String get dailyUsageLimit;

  /// No description provided for @perDay.
  ///
  /// In en, this message translates to:
  /// **'per day'**
  String get perDay;

  /// No description provided for @smartSuggestions.
  ///
  /// In en, this message translates to:
  /// **'Smart Suggestions'**
  String get smartSuggestions;

  /// No description provided for @recommendedForYou.
  ///
  /// In en, this message translates to:
  /// **'Recommended for you'**
  String get recommendedForYou;

  /// No description provided for @nearbyPlaces.
  ///
  /// In en, this message translates to:
  /// **'Nearby Places'**
  String get nearbyPlaces;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get seeAll;

  /// No description provided for @takeAWalkNearby.
  ///
  /// In en, this message translates to:
  /// **'Take a walk nearby'**
  String get takeAWalkNearby;

  /// No description provided for @walkRefreshMind.
  ///
  /// In en, this message translates to:
  /// **'20 min can refresh your mind'**
  String get walkRefreshMind;

  /// No description provided for @readFor10Minutes.
  ///
  /// In en, this message translates to:
  /// **'Read for 10 minutes'**
  String get readFor10Minutes;

  /// No description provided for @readReduceStress.
  ///
  /// In en, this message translates to:
  /// **'Improve focus and reduce stress'**
  String get readReduceStress;

  /// No description provided for @breathingExercise.
  ///
  /// In en, this message translates to:
  /// **'Breathing exercise'**
  String get breathingExercise;

  /// No description provided for @calmMind5Min.
  ///
  /// In en, this message translates to:
  /// **'Calm your mind in 5 min'**
  String get calmMind5Min;

  /// No description provided for @perfectWeatherWalk.
  ///
  /// In en, this message translates to:
  /// **'Perfect weather for a walk!'**
  String get perfectWeatherWalk;

  /// No description provided for @focusTime.
  ///
  /// In en, this message translates to:
  /// **'Focus Time'**
  String get focusTime;

  /// No description provided for @nextBreakIn.
  ///
  /// In en, this message translates to:
  /// **'Next break in'**
  String get nextBreakIn;

  /// No description provided for @blockedApps.
  ///
  /// In en, this message translates to:
  /// **'Blocked Apps'**
  String get blockedApps;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @enterFocusMode.
  ///
  /// In en, this message translates to:
  /// **'Enter Focus Mode'**
  String get enterFocusMode;

  /// No description provided for @selectedApps.
  ///
  /// In en, this message translates to:
  /// **'Selected Apps'**
  String get selectedApps;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// No description provided for @happy.
  ///
  /// In en, this message translates to:
  /// **'Happy'**
  String get happy;

  /// No description provided for @calm.
  ///
  /// In en, this message translates to:
  /// **'Calm'**
  String get calm;

  /// No description provided for @focused.
  ///
  /// In en, this message translates to:
  /// **'Focused'**
  String get focused;

  /// No description provided for @relaxed.
  ///
  /// In en, this message translates to:
  /// **'Relaxed'**
  String get relaxed;

  /// No description provided for @excited.
  ///
  /// In en, this message translates to:
  /// **'Excited'**
  String get excited;

  /// No description provided for @sad.
  ///
  /// In en, this message translates to:
  /// **'Sad'**
  String get sad;

  /// No description provided for @stressed.
  ///
  /// In en, this message translates to:
  /// **'Stressed'**
  String get stressed;

  /// No description provided for @motivated.
  ///
  /// In en, this message translates to:
  /// **'Motivated'**
  String get motivated;

  /// No description provided for @sleepy.
  ///
  /// In en, this message translates to:
  /// **'Sleepy'**
  String get sleepy;

  /// No description provided for @energetic.
  ///
  /// In en, this message translates to:
  /// **'Energetic'**
  String get energetic;

  /// No description provided for @anxious.
  ///
  /// In en, this message translates to:
  /// **'Anxious'**
  String get anxious;

  /// No description provided for @creative.
  ///
  /// In en, this message translates to:
  /// **'Creative'**
  String get creative;

  /// No description provided for @whatsYourMoodToday.
  ///
  /// In en, this message translates to:
  /// **'What\'s Your Mood Today?'**
  String get whatsYourMoodToday;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @deepWork.
  ///
  /// In en, this message translates to:
  /// **'Deep Work'**
  String get deepWork;

  /// No description provided for @stayFocusedMessage.
  ///
  /// In en, this message translates to:
  /// **'Stay focused, you\'re doing great!'**
  String get stayFocusedMessage;

  /// No description provided for @appsAreBlocked.
  ///
  /// In en, this message translates to:
  /// **'Apps are blocked'**
  String get appsAreBlocked;

  /// No description provided for @end.
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get end;

  /// No description provided for @focusBetterCalmMind.
  ///
  /// In en, this message translates to:
  /// **'Focus better. Calm your mind.'**
  String get focusBetterCalmMind;

  /// No description provided for @buildHealthierYou.
  ///
  /// In en, this message translates to:
  /// **'Build a healthier you.'**
  String get buildHealthierYou;

  /// No description provided for @stayFocused.
  ///
  /// In en, this message translates to:
  /// **'Stay Focused'**
  String get stayFocused;

  /// No description provided for @stayFocusedDescription.
  ///
  /// In en, this message translates to:
  /// **'Block distractions and enter deep focus.'**
  String get stayFocusedDescription;

  /// No description provided for @feelBetter.
  ///
  /// In en, this message translates to:
  /// **'Feel Better'**
  String get feelBetter;

  /// No description provided for @feelBetterDescription.
  ///
  /// In en, this message translates to:
  /// **'Build healthy habits for body and mind.'**
  String get feelBetterDescription;

  /// No description provided for @trackProgress.
  ///
  /// In en, this message translates to:
  /// **'Track Progress'**
  String get trackProgress;

  /// No description provided for @trackProgressDescription.
  ///
  /// In en, this message translates to:
  /// **'Insights to help you grow every day.'**
  String get trackProgressDescription;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en', 'ta'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'ta':
      return AppLocalizationsTa();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
