import 'package:cookbook/BOs/InsightsBarGraphBO/InsightsBarGraphBO.dart';
import 'package:cookbook/Helpers/Responsive.dart';
import 'package:flutter/material.dart';

class ReusableInsightsBarGraph extends StatelessWidget {
   final InsightsBarGraphBO insightsBarGraphBOData;
   ReusableInsightsBarGraph({super.key, required this.insightsBarGraphBOData});

  @override
  Widget build(BuildContext context) {
    return    Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: ResponsiveUI.h(100, context),
          child: Align(
             alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
            
              duration: Duration(milliseconds: 700),
            
              curve: Curves.easeInOut,
            
              height: ResponsiveUI.h(insightsBarGraphBOData.focusedbarHeight, context),
            
              width: ResponsiveUI.w(8, context),
            
              decoration: BoxDecoration(
                color: Color(0xFF5140F2),
            
                borderRadius: BorderRadius.only(topLeft: Radius.circular(ResponsiveUI.r(2, context)), topRight: Radius.circular(ResponsiveUI.r(2, context))),
              ),
            ),
          ),
        ),
        SizedBox(width: ResponsiveUI.w(2, context),),
         SizedBox(
            height: ResponsiveUI.h(100, context),
           child: Align(
              alignment: Alignment.bottomCenter,
             child: AnimatedContainer(
             
                   duration: Duration(milliseconds: 700),
             
                   curve: Curves.easeInOut,
             
                   height: ResponsiveUI.h(insightsBarGraphBOData.distractedBarHeight, context),
             
                   width: ResponsiveUI.w(8, context),
             
                   decoration: BoxDecoration(
                     color: Color(0xFFF55745),
             
                     borderRadius: BorderRadius.only(topLeft: Radius.circular(ResponsiveUI.r(2, context)), topRight: Radius.circular(ResponsiveUI.r(2, context))),
                   ),
                 ),
           ),
         ),
      ],
    );
  }
}