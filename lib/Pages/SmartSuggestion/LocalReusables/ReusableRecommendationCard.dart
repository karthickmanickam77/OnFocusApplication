import 'package:cookbook/Helpers/Responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Reusablerecommendationcard extends StatelessWidget {
  const Reusablerecommendationcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: ResponsiveUI.h(14, context),
          horizontal: ResponsiveUI.w(16, context)),
      // width: ResponsiveUI.w(353, context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ResponsiveUI.r(8, context)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 0),
                blurRadius: ResponsiveUI.r(4, context),
                spreadRadius: ResponsiveUI.r(1, context),
                color: Colors.black.withOpacity(0.15))
          ]),
      child: Row(
        children: [
          Image.asset(
            "lib/Helpers/Images/walking.png",
            width: ResponsiveUI.w(46, context),
          ),
          SizedBox(
            width: ResponsiveUI.w(23, context),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Take a walk nearby',
                style: GoogleFonts.inter(
                    fontSize: ResponsiveUI.sp(15, context),
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: ResponsiveUI.h(4, context),
              ),
              Text(
                '20 min can refresh your mind',
                style: GoogleFonts.inter(
                    fontSize: ResponsiveUI.sp(13, context),
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          Expanded(child: SizedBox()),
          Image.asset(
            "lib/Helpers/Images/backIcon.png",
            width: ResponsiveUI.w(6.25, context),
          ),
          SizedBox(
            width: ResponsiveUI.w(11.5, context),
          )
        ],
      ),
    );
  }
}
