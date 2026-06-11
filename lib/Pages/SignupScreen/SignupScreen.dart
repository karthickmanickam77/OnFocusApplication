import 'package:cookbook/Helpers/Language_Localization/app_localizations.dart';
import 'package:cookbook/Helpers/Responsive.dart';
import 'package:cookbook/Pages/Reusables/AuthenticationButton.dart';
import 'package:cookbook/Pages/SignupScreen/DependentView/FeaturesCard.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Color(0xfffbfafe),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveUI.w(24, context),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: ResponsiveUI.h(30, context),
                ),

                /// Illustration
                Image.asset(
                  'lib/Helpers/Images/signup_Image.png',
                  height: ResponsiveUI.h(200, context),
                  fit: BoxFit.contain,
                ),

                SizedBox(
                  height: ResponsiveUI.h(8, context),
                ),

                /// Logo
                Container(
                  height: ResponsiveUI.h(58, context),
                  width: ResponsiveUI.w(58, context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      ResponsiveUI.r(16, context),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      ResponsiveUI.r(14, context),
                    ),
                    child: Image.asset(
                      'lib/Helpers/Images/focus_app_Icon.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(
                  height: ResponsiveUI.h(18, context),
                ),

                /// Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Deep Work',
                      style: TextStyle(
                        fontSize: ResponsiveUI.sp(18, context),
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: ResponsiveUI.w(4, context),
                    ),
                    Image.asset(
                      'lib/Helpers/Images/green_tea.png',
                      height: ResponsiveUI.h(20, context),
                      width: ResponsiveUI.w(20, context),
                    ),
                  ],
                ),

                SizedBox(
                  height: ResponsiveUI.h(12, context),
                ),

                /// Subtitle
                Text(
                  lang.focusBetterCalmMind,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: ResponsiveUI.sp(14, context),
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF6B6B85),
                  ),
                ),

                SizedBox(
                  height: ResponsiveUI.h(4, context),
                ),

                Text(
                  lang.buildHealthierYou,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: ResponsiveUI.sp(14, context),
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF6B6B85),
                  ),
                ),

                SizedBox(
                  height: ResponsiveUI.h(30, context),
                ),

                /// Features

                FeaturesCard(
                  image: 'lib/Helpers/Images/startFocusIcon.png',
                  title: lang.stayFocused,
                  description: lang.stayFocusedDescription,
                  foregroundcolor: Color(0xFF4a2bef),
                  background: const Color(0xFFe8e6fe),
                ),

                SizedBox(
                  height: ResponsiveUI.h(10, context),
                ),

                FeaturesCard(
                  image: 'lib/Helpers/Images/takeaBreakIcon.png',
                  title: lang.feelBetter,
                  description: lang.feelBetterDescription,
                  background: const Color(0xFFeafaef),
                  foregroundcolor: Color(0xFF17b561),
                ),

                SizedBox(
                  height: ResponsiveUI.h(10, context),
                ),

                FeaturesCard(
                  image: 'lib/Helpers/Images/InsightsIcon.png',
                  title: lang.trackProgress,
                  description: lang.trackProgressDescription,
                  background: const Color(0xFFfff0e1),
                  foregroundcolor: const Color(0xFFfd9617),
                ),

                SizedBox(
                  height: ResponsiveUI.h(26, context),
                ),

                /// CTA Button

                AuthenticationButton(onPressed: () {}, text: lang.getStarted),

                SizedBox(
                  height: ResponsiveUI.h(22, context),
                ),

                /// Login Text

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      lang.alreadyHaveAccount,
                      style: TextStyle(
                        fontFamily: 'SPFProRounded',
                        fontSize: ResponsiveUI.sp(14, context),
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF6B6B85),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        ' ${lang.login}',
                        style: TextStyle(
                          fontFamily: 'SPFProRounded',
                          fontSize: ResponsiveUI.sp(14, context),
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF4B3CF0),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: ResponsiveUI.h(10, context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
