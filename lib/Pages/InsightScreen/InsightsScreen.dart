// ignore_for_file: file_names, unused_local_variable, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cookbook/BOs/InsightsBarGraphBO/InsightsBarGraphBO.dart';
import 'package:cookbook/Helpers/Language_Localization/app_localizations.dart';
import 'package:cookbook/Helpers/Responsive.dart';
import 'package:cookbook/Helpers/Utilities/Enums/InsightsFilter.dart';
import 'package:cookbook/Helpers/Utilities/Extensions/WeekDayExtension.dart';
import 'package:cookbook/Pages/InsightScreen/InsightsScreenVM.dart';
import 'package:cookbook/Pages/InsightScreen/DependentView/InsightsHeaderScreen.dart';
import 'package:cookbook/Pages/InsightScreen/DependentView/ReusableInsightsBarGraph.dart';
import 'package:cookbook/Pages/InsightScreen/DependentView/ReusableProgressBar.dart';
import 'package:cookbook/Pages/InsightScreen/DependentView/ResusableWidgets.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InsightsScreen extends ConsumerWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context)!;
    final vm = ref.watch(insightsScreenProvider);
    final List<String> time = [
      "12 AM",
      "6 AM",
      "12 PM",
      "6 PM",
    ];
    final List<String> hoursInBarGraph = ['6h', '4h', '2h', '0h'];
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding:
              EdgeInsets.symmetric(horizontal: ResponsiveUI.w(14, context)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InsightsHeaderScreen(),
                SizedBox(
                  height: ResponsiveUI.h(10, context),
                ),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffFDFDFE),
                        borderRadius:
                            BorderRadius.circular(ResponsiveUI.r(8, context)),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff000000).withOpacity(0.25),
                            blurRadius: ResponsiveUI.r(4, context),
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      width: ResponsiveUI.w(360, context),
                      padding: EdgeInsets.only(
                          left: ResponsiveUI.w(5, context),
                          top: ResponsiveUI.h(11, context),
                          bottom: ResponsiveUI.h(8, context)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lang.focusVsDistraction, //'Focus vs Distraction',
                            style: TextStyle(
                              fontFamily: 'SFPro',
                              fontSize: ResponsiveUI.sp(16, context),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: ResponsiveUI.h(12, context),
                          ),
                          (vm.getSelectedFilter() == InsightFilter.thisWeek)
                              ? SizedBox(height: ResponsiveUI.h(12, context))
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InsightScreenBarGraphCategory(
                                        categoryName: lang.focusedTime,
                                        categoryColor: Color(0xFF5140F2)),
                                    SizedBox(
                                      width: ResponsiveUI.w(30, context),
                                    ),
                                    InsightScreenBarGraphCategory(
                                        categoryName: lang.distractedTime,
                                        categoryColor: Color(0xFFF55757)),
                                  ],
                                ),
                          SizedBox(
                            height: ResponsiveUI.h(20, context),
                          ),
                          (vm.getSelectedFilter() == InsightFilter.thisMonth)
                              ? Padding(
                                  padding: EdgeInsets.only(
                                      left: ResponsiveUI.w(50, context),
                                      right: ResponsiveUI.w(34, context)),
                                  child: SizedBox(
                                    height: ResponsiveUI.h(100, context),
                                    child: LineGraphInsights(),
                                  ))
                              : Padding(
                                  padding: EdgeInsets.only(
                                      left: ResponsiveUI.w(50, context),
                                      right: ResponsiveUI.w(34, context)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: List.generate(
                                        vm.getGraphList().length, (index) {
                                      return ReusableInsightsBarGraph(
                                          insightsBarGraphBOData:
                                              (vm.getSelectedFilter() ==
                                                      InsightFilter.thisWeek)
                                                  ? InsightsBarGraphBO(
                                                      focusedbarHeight: 100,
                                                      distractedBarHeight: 51)
                                                  : InsightsBarGraphBO(
                                                      focusedbarHeight: 27,
                                                      distractedBarHeight: 13));
                                    }),
                                  ),
                                ),
                          SizedBox(
                            height: ResponsiveUI.h(11, context),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: ResponsiveUI.w(34, context),
                                left: ResponsiveUI.w(50, context)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(vm.getGraphList().length,
                                  (index) {
                                return Text(
                                  vm.getGraphList()[index].short(context),
                                  style: TextStyle(
                                    fontFamily: 'SFPro',
                                    fontSize: ResponsiveUI.sp(10, context),
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff000000),
                                  ),
                                );
                              }),
                            ),
                          )
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(ResponsiveUI.w(8, context),
                          ResponsiveUI.h(70, context)),
                      child: Column(
                        children:
                            List.generate(hoursInBarGraph.length, (index) {
                          return Column(
                            children: [
                              Text(
                                hoursInBarGraph[index],
                                style: TextStyle(
                                  fontFamily: 'SFPro',
                                  fontSize: ResponsiveUI.sp(10, context),
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff000000),
                                ),
                              ),
                              SizedBox(
                                height: ResponsiveUI.h(22, context),
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ResponsiveUI.h(10, context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        lang.topDistractionApps,
                        style: TextStyle(
                          fontFamily: 'SFProRounded',
                          fontSize: ResponsiveUI.sp(21, context),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      lang.totalTime,
                      style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontSize: ResponsiveUI.sp(15, context),
                        fontWeight: FontWeight.w600,
                        color: Color(0xff686973),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ResponsiveUI.h(10, context),
                ),
                Column(
                    children: List.generate(5, (index) {
                  return Padding(
                    padding:
                        EdgeInsets.only(bottom: ResponsiveUI.h(12, context)),
                    child: ReusableProgrssBar(),
                  );
                })),
                SizedBox(
                  height: ResponsiveUI.h(4, context),
                ),
                Text(
                  lang.productiveHeatmap,
                  style: TextStyle(
                    fontFamily: 'SFRounded',
                    fontSize: ResponsiveUI.sp(18, context),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: ResponsiveUI.w(28, context),
                      bottom: ResponsiveUI.h(11, context),
                      top: ResponsiveUI.h(10, context)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                        time.length,
                        (index) => SizedBox(
                              height: ResponsiveUI.h(14, context),
                              child: Center(
                                child: Text(
                                  time[index],
                                  style: TextStyle(
                                    fontFamily: 'SFProRounded',
                                    fontSize: ResponsiveUI.sp(12, context),
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff787995),
                                  ),
                                ),
                              ),
                            )).toList(),
                  ),
                ),
                Row(
                  children: [
                    Column(
                      children: List.generate(
                          vm.days.length,
                          (index) => SizedBox(
                                height: ResponsiveUI.h(16.5, context),
                                child: Center(
                                  child: Text(
                                    vm.days[index].short(context),
                                    style: TextStyle(
                                      fontFamily: 'SFProRounded',
                                      fontSize: ResponsiveUI.sp(12, context),
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff787995),
                                    ),
                                  ),
                                ),
                              )).toList(),
                    ),
                    SizedBox(
                      width: ResponsiveUI.w(13, context),
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 20,
                            mainAxisSpacing: ResponsiveUI.h(3, context),
                            crossAxisSpacing: ResponsiveUI.w(3, context),
                            childAspectRatio: 1),
                        itemBuilder: (context, index) {
                          return Container(
                            height: ResponsiveUI.h(14, context),
                            width: ResponsiveUI.w(14, context),
                            decoration: BoxDecoration(
                              color: (index % 20 == 7 || index % 20 == 12)
                                  ? Color(0xFF5140F2).withOpacity(0.26)
                                  : (index % 20 == 8 || index % 20 == 11)
                                      ? Color(0xFF5140F2).withOpacity(0.71)
                                      : (index % 20 == 9 || index % 20 == 10)
                                          ? Color(0xFF5140F2)
                                          : Color(0xffEEF0FF),
                              borderRadius: BorderRadius.circular(
                                  ResponsiveUI.r(2, context)),
                            ),
                          );
                        },
                        itemCount: (20 * 7),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
