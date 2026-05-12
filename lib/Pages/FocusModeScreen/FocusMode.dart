// FocusModeScreen.dart

import 'package:cookbook/Helpers/Responsive.dart';
import 'package:cookbook/Pages/FocusModeScreen/LocalReusables/ReusableBlockedAppsList.dart';
import 'package:cookbook/Pages/Reusables/ReusableFocusTimer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'FocusModeVM.dart';

class FocusModeScreen extends ConsumerWidget {
  const FocusModeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(focusModeProvider);

    return Scaffold(
      backgroundColor: Color(0xFFFDFDFE),
      appBar: AppBar(
        leadingWidth: double.infinity,
        leading: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: ResponsiveUI.w(16, context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "lib/Helpers/Images/leftarrow.png",
                width: ResponsiveUI.w(40, context),
              ),
              Text(
                'Focus Mode',
                style: TextStyle(
                  fontFamily: 'SFProRounded',
                  fontSize: ResponsiveUI.sp(20, context),
                  fontWeight: FontWeight.w700,
                ),
              ),
              Image.asset(
                "lib/Helpers/Images/setting.png",
                width: ResponsiveUI.w(40, context),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: ResponsiveUI.h(75, context),
              ),
              ReusableFocusTimer(
                  currentValue:
                      (vm.remainingSeconds / 25).clamp(1, 25).toDouble(),
                  maxValue: 25,
                  formattedTime: vm.getFormattedTime(),
                  title: 'Focus Time',
                  isEditable: true,
                  onChanged: (value) =>
                      ref.read(focusModeProvider).changeTimer(value)),
              SizedBox(
                height: ResponsiveUI.h(33, context),
              ),
              Text(
                'Next break in 25:00',
                style: TextStyle(
                  fontFamily: 'SFProRounded',
                  fontSize: ResponsiveUI.sp(18, context),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: ResponsiveUI.h(14, context),
              ),
              Container(
                width: double.infinity,
                height: ResponsiveUI.h(0, context),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffF3F3FA),
                      width: ResponsiveUI.w(1, context),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff000000).withOpacity(0.05),
                        offset: Offset(0, 1),
                        blurRadius: 0,
                        spreadRadius: 0,
                      )
                    ]),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: ResponsiveUI.w(16, context),
                    right: ResponsiveUI.w(16, context),
                    bottom: ResponsiveUI.h(25, context),
                    top: ResponsiveUI.h(14, context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Blocked Apps',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SF Pro',
                          fontSize: ResponsiveUI.sp(18, context),
                          fontWeight: FontWeight.w600,
                        )),
                    Text('Edit',
                        style: TextStyle(
                          color: Color(0xff8785C8),
                          fontFamily: 'SF Pro',
                          fontSize: ResponsiveUI.sp(18, context),
                          fontWeight: FontWeight.w600,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ResponsiveUI.w(16, context)),
                child:Column(
                  children: [
                    Reusableblockedappslist(),
                    Reusableblockedappslist(),
                    Reusableblockedappslist(),
                    Reusableblockedappslist(),],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
