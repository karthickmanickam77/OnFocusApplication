import 'package:cookbook/Helpers/Responsive.dart';
import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class ReusableProgrssBar extends StatelessWidget {
  const ReusableProgrssBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                Image.asset(
                  'lib/Helpers/Images/instagram.png',
                  width: ResponsiveUI.w(32, context),
                ),
                SizedBox(width: ResponsiveUI.w(20, context),),
                Text('Instagram',style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: ResponsiveUI.sp(16, context),
                  fontWeight: FontWeight.w600,
                ),),
                SizedBox(width: ResponsiveUI.w(20, context)),
                Expanded(
      child: LinearProgressBar(
        maxSteps: 100,

        progressType: ProgressType.linear,

        currentStep: 64,

        progressColor: Color(0xffF63018).withOpacity(0.8),

        backgroundColor: Color(0xffF3F3FA),

        borderRadius: BorderRadius.circular(10),

        minHeight: ResponsiveUI.h(3, context),
      ),
    ),
    SizedBox(width: ResponsiveUI.w(20, context)),
  
                              Text('45m',style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: ResponsiveUI.sp(16, context),
                  fontWeight: FontWeight.w600,
                ),),
              ],
             )
           ;
  }
}