// FocusModeScreen.dart

import 'dart:async';

import 'package:cookbook/Helpers/AppNavigations/NavigationHelpers.dart';
import 'package:cookbook/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:cookbook/Helpers/Language_Localization/app_localizations.dart';
import 'package:cookbook/Helpers/Responsive.dart';
import 'package:cookbook/Helpers/Utilities/Local_Utils.dart';
import 'package:cookbook/Pages/FocusModeScreen/DependentView/ReusableBlockedAppsList.dart';
import 'package:cookbook/Pages/Reusables/ReusableFocusTimer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'FocusModeVM.dart';

class FocusModeScreen extends ConsumerStatefulWidget {
  const FocusModeScreen({super.key});
  @override
  ConsumerState<FocusModeScreen> createState() => _FocusModeScreenState();
}

class _FocusModeScreenState extends ConsumerState<FocusModeScreen> {
  StreamSubscription? navigationSubscription;

  @override
  void initState() {
    super.initState();
    navigationSubscription =
        ref.read(focusModeProvider).navigationStream.stream.listen((event) {
      if (event is NavigatorPush) {
        context.push(
          pageConfig: event.pageConfig,
          data: event.data,
        );
      }
      // if (event is NavigatorPush) {
      //   Future(() async {
      //     final result = await context.push(
      //       pageConfig: event.pageConfig,
      //       data: event.data,
      //     );

      //     if (result == true) {
      //       // setState(() {});

      //       // OR
      //       ref.invalidate(focusModeProvider);
      //     }
      //   });
      // }
    });
  }

  @override
  void dispose() {
    navigationSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
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
                lang.focusMode,
                style: TextStyle(
                  fontFamily: 'SFProRounded',
                  fontSize: ResponsiveUI.sp(20, context),
                  fontWeight: FontWeight.w700,
                ),
              ),
              GestureDetector(
                onTap: () {
                  vm.navigationToAppBlockingScreen();
                },
                child: Image.asset(
                  "lib/Helpers/Images/setting.png",
                  width: ResponsiveUI.w(40, context),
                ),
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
                  title: lang.focusedTime,
                  isEditable: true,
                  onChanged: (value) =>
                      ref.read(focusModeProvider).changeTimer(value)),
              SizedBox(
                height: ResponsiveUI.h(33, context),
              ),
              Text(
                lang.nextBreakIn + ' 25:00',
                style: TextStyle(
                  fontFamily: 'SFProRounded',
                  fontSize: ResponsiveUI.sp(
                      LocaleUtils.isTamil(context) ? 15 : 18, context),
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
                    Text(lang.blockedApps,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SF Pro',
                          fontSize: ResponsiveUI.sp(
                              LocaleUtils.isTamil(context) ? 15 : 18, context),
                          fontWeight: FontWeight.w600,
                        )),
                    Text(lang.edit,
                        style: TextStyle(
                          color: Color(0xff8785C8),
                          fontFamily: 'SF Pro',
                          fontSize: ResponsiveUI.sp(
                              LocaleUtils.isTamil(context) ? 15 : 18, context),
                          fontWeight: FontWeight.w600,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ResponsiveUI.w(16, context)),
                child: SizedBox(
                  height: ResponsiveUI.h(130, context),
                  child: ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: vm.getBlockedApps().length,
                      itemBuilder: (context, index) {
                        return Reusableblockedappslist(
                          appDetail: vm.blockedApps[index],
                          onRemove: () => vm.removeBlockedApps(index),
                        );
                      }),
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
                      vm.updateRestrictedAppsList();
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
                          lang.enterFocusMode,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'SF Pro',
                            fontSize: ResponsiveUI.sp(
                                LocaleUtils.isTamil(context) ? 15 : 20,
                                context),
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
