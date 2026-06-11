import 'package:cookbook/Helpers/Language_Localization/app_localizations.dart';
import 'package:cookbook/Helpers/Responsive.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class FocusScoreWidget extends StatelessWidget {
  final double focusScore;
  const FocusScoreWidget({super.key, required this.focusScore});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    return Center(
      child: CircularPercentIndicator(
        radius: ResponsiveUI.r(84, context),
        lineWidth: ResponsiveUI.w(12, context),
        percent: focusScore / 100,
        circularStrokeCap: CircularStrokeCap.round,
        backgroundColor: const Color(0xFFECECFB),
        progressColor: const Color(0xFF5140F2),
        animation: true,
        animationDuration: 1200,
        center: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: focusScore.toInt().toString(),
                    style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontSize: ResponsiveUI.sp(50, context),
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: '%',
                    style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontSize: ResponsiveUI.sp(18, context),
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            //  SizedBox(height: ResponsiveUI.h(5, context)),

            Text(
              lang.focusScore, // 'Focus Score',

              style: TextStyle(
                fontFamily: 'SFProRounded',
                fontSize: ResponsiveUI.sp(14, context),
                fontWeight: FontWeight.w700,
                color: Color(0xFFA7A7B7),
              ),
            ),

            SizedBox(height: ResponsiveUI.h(9, context)),

            Container(
              height: ResponsiveUI.h(16, context),
              width: ResponsiveUI.w(51, context),
              decoration: BoxDecoration(
                color: const Color(0xFFE4E1F7),
                borderRadius: BorderRadius.circular(ResponsiveUI.r(8, context)),
              ),
              child: Center(
                child: Text(
                  'Today',
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: ResponsiveUI.sp(10, context),
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5140F2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
