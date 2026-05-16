import 'package:cookbook/Helpers/Responsive.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class InsightScreenBarGraphCategory extends StatelessWidget {
  final String categoryName;
  final Color categoryColor;
  InsightScreenBarGraphCategory({super.key, required this.categoryName, required this.categoryColor});
  

  @override
  Widget build(BuildContext context) {
    return Row(
                    children: [
                      Container(
                        width: ResponsiveUI.w(11, context),
                        height: ResponsiveUI.h(11, context),
                        decoration: BoxDecoration(
                          color: categoryColor,
                          borderRadius: BorderRadius.circular(ResponsiveUI.r(2, context)),
                        ),
                      ),
                      SizedBox(width: ResponsiveUI.w(7, context),),
                      Text(categoryName,style: TextStyle(
                        fontFamily: 'SFProRounded',
                        fontSize: ResponsiveUI.sp(11, context),
                        fontWeight: FontWeight.w600,
                        color: Color(0xff000000),
                      ),),
                    ],
                  );
  }
}

class LineGraphInsights extends StatelessWidget {
  const LineGraphInsights({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
                             LineChartData(
                               lineTouchData: LineTouchData(
                                 enabled: true,
                                 touchTooltipData: LineTouchTooltipData(
                                   getTooltipColor: (LineBarSpot touchedSpot) => Colors.black,
                                   getTooltipItems: (touchedSpots) {
                                     return touchedSpots.map((touchedSpot) {
                                       return LineTooltipItem(
                                         '${touchedSpot.y}h',
                                         TextStyle(
                                           fontFamily: 'SFPro',
                                           fontSize: ResponsiveUI.sp(12, context),
                                           fontWeight: FontWeight.w600,
                                           color: Color(0xffffffff),
                                         ),
                                       );
                                     }).toList();
                                   },
                                 ),
                               ),
                               gridData: FlGridData(
                                 show: false,
                               ),
                           
                               titlesData: FlTitlesData(
                                 show: false,
                               ),
                           
                               borderData: FlBorderData(
                                 show: false,
                               ),
                           
                               minX: 0,
                               maxX: 31,
                           
                               minY: 0,
                               maxY: 6,
                           
                               lineBarsData: [
                           
                                 LineChartBarData(
                           
                                   spots: const [
                           
                                     FlSpot(0, 3),
                                     FlSpot(1, 3),
                                     FlSpot(2, 2),
                                     FlSpot(3, 5),
                                     FlSpot(5, 3.1),
                                     FlSpot(6, 3),
                                     FlSpot(10, 3.1),
                                     FlSpot(11, 3),
                                     FlSpot(14, 2),
                                     FlSpot(15.9, 5),
                                     FlSpot(18, 5),
                                     FlSpot(20, 2),
                                     FlSpot(22, 2.9),
                                     FlSpot(24, 3),
                                     FlSpot(25, 5.4),
                                     FlSpot(26, 5.9),
                                     FlSpot(27, 0.75),
                                     FlSpot(28, 1.4),
                                     FlSpot(29, 5),
                                     FlSpot(30, 3),
                                     FlSpot(31, 4),
                                   ],
                           
                                   isCurved: true,
                           
                                   color: Color(0xFF5140F2),
                           
                                   barWidth: ResponsiveUI.w(3, context),
                           
                                   isStrokeCapRound: true,
                           
                                   dotData: FlDotData(
                                     show: false,
                                   ),
                           
                                   belowBarData: BarAreaData(
                           
                                     show: true,
                           
                                     gradient: LinearGradient(
                                       colors: [
                           
                                         Color(0xffeceafe),
                           
                                         Color(0xFFFFFFFF)
                                             .withOpacity(0.3),
                                       ],
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           );
  }
}