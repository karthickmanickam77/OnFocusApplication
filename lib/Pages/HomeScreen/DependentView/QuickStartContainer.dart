import 'package:cookbook/Helpers/Language_Localization/app_localizations.dart';
import 'package:cookbook/Helpers/Responsive.dart';
import 'package:flutter/material.dart';

class QuickStartContainer extends StatelessWidget {
  final String image;
  final String text;
  final Color colorCode;
  const QuickStartContainer({
    required this.colorCode,
    required this.text,
    required this.image,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorCode,
        borderRadius: BorderRadius.circular(ResponsiveUI.r(16, context)),
      ),
      height: ResponsiveUI.h(80, context),
      width: ResponsiveUI.w(165, context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: ResponsiveUI.h(42, context),
            width: ResponsiveUI.w(42, context),
          ),
          Transform.translate(
            offset: Offset(0, -ResponsiveUI.h(5, context)),
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'SF Pro',
                fontSize: ResponsiveUI.sp(13, context),
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
