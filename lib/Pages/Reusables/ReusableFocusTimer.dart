import 'package:cookbook/Helpers/Responsive.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ReusableFocusTimer extends StatelessWidget {
  final double currentValue;

  final double maxValue;

  final String formattedTime;

  final String title;

  final bool isEditable;

  final Function(double)? onChanged;

  const ReusableFocusTimer({
    super.key,
    required this.currentValue,
    required this.maxValue,
    required this.formattedTime,
    required this.title,
    required this.isEditable,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
      appearance: CircularSliderAppearance(
        size: ResponsiveUI.w(260, context),
        startAngle: 270,
        angleRange: 360,
        customWidths: CustomSliderWidths(
          progressBarWidth: ResponsiveUI.w(12, context),
          trackWidth: ResponsiveUI.w(12, context),
        ),
        customColors: CustomSliderColors(
          progressBarColor: Color(0xff5140F2),
          trackColor: Color(0xffECECFB),
          dotColor: isEditable ? Color(0xff5140F2) : Colors.transparent,
        ),
        animationEnabled: true,
      ),
      min: 0,
      max: maxValue,
      initialValue: currentValue,
      onChange: isEditable ? onChanged : null,
      innerWidget: (double value) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formattedTime,
              style: TextStyle(
                fontFamily: 'SFProRounded',
                fontSize: ResponsiveUI.sp(42, context),
                fontWeight: FontWeight.bold,
                color: !isEditable ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(
              height: ResponsiveUI.h(6, context),
            ),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'SF Pro',
                fontSize: ResponsiveUI.sp(18, context),
                fontWeight: FontWeight.w600,
                color: Color(0xffA0A0B2),
              ),
            ),
          ],
        );
      },
    );
  }
}
