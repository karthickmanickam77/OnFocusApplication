// FocusModeScreen.dart

import 'package:cookbook/Helpers/AppNavigations/NavigationHelpers.dart';
import 'package:cookbook/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:cookbook/Helpers/Responsive.dart';
import 'package:cookbook/Pages/FocusModeScreen/DependentView/ReusableBlockedAppsList.dart';
import 'package:cookbook/Pages/Reusables/ReusableFocusTimer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'FocusModeVM.dart';

class FocusModeScreen extends ConsumerStatefulWidget {
  const FocusModeScreen({super.key});

  @override
  ConsumerState<FocusModeScreen> createState() => _FocusModeScreenState();
}

class _FocusModeScreenState extends ConsumerState<FocusModeScreen> {
  @override
  void initState() {
    super.initState();
    
    ref.read(focusModeProvider).navigationStream.stream.listen((event) {
      if (event is NavigatorPush) {
        context.push(
          pageConfig: event.pageConfig,
          data: event.data,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                      (vm.remainingSeconds / 60).clamp(1, 25).toDouble(),
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
                child: Column(
                  children: List.generate(
                      vm.getBlockedApps().length,
                      (index) => Reusableblockedappslist(
                            onRemove: () => vm.removeBlockedApps(index),
                          )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: ResponsiveUI.w(16, context),
                    right: ResponsiveUI.w(16, context),
                    top: ResponsiveUI.h(27, context)),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff5140F2),
                        padding: EdgeInsets.symmetric(
                            vertical: ResponsiveUI.h(13, context)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                ResponsiveUI.r(16, context)))),
                    onPressed: () {
                      vm.navigationToTimerScreen();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/Helpers/Images/Play.png',
                          width: ResponsiveUI.w(35, context),
                        ),
                        SizedBox(
                          width: ResponsiveUI.w(10, context),
                        ),
                        Text(
                          'Enter Focus Mode',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'SF Pro',
                            fontSize: ResponsiveUI.sp(20, context),
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
