import 'package:cookbook/Helpers/Responsive.dart';
import 'package:flutter/material.dart';

class FeaturesCard extends StatelessWidget {
  String image;
  String title;
  String description;
  Color? background;
  Color? foregroundcolor;
  FeaturesCard(
      {super.key,
      required this.image,
      required this.title,
      required this.description,
      this.background,
      this.foregroundcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: ResponsiveUI.h(8, context),
          vertical: ResponsiveUI.w(8, context)),
      decoration: BoxDecoration(
        color: Color(0xfff7f6fd),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            height: ResponsiveUI.h(50, context),
            width: ResponsiveUI.w(50, context),
            decoration: BoxDecoration(
              color: background ?? Color(0xffe0e0e0),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Image.asset(
                image,
                color: foregroundcolor ?? Color(0xff000000),
                height: ResponsiveUI.h(24, context),
                width: ResponsiveUI.w(24, context),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'SPFProRounded',
                    fontSize: ResponsiveUI.sp(14, context),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontFamily: 'SPFProRounded',
                    fontSize: ResponsiveUI.sp(12, context),
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
