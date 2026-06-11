import 'dart:async';

import 'package:cookbook/Helpers/AppNavigations/NavigationHelpers.dart';
import 'package:cookbook/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:cookbook/Helpers/Language_Localization/app_localizations.dart';
import 'package:cookbook/Helpers/Responsive.dart';
import 'package:cookbook/Helpers/Utilities/Local_Utils.dart';
import 'package:cookbook/Pages/AppBlockingScreen/AppBlockingScreenVM.dart';
import 'package:cookbook/Pages/AppBlockingScreen/DependentView/BlockedAppsList.dart';
import 'package:cookbook/Pages/AppBlockingScreen/DependentView/BlockingRules.dart';
import 'package:cookbook/Pages/AppBlockingScreen/DependentView/ToggleSwitch.dart';
import 'package:cookbook/Pages/FocusModeScreen/FocusModeVM.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppBlockingScreen extends ConsumerStatefulWidget {
  const AppBlockingScreen({super.key});

  @override
  ConsumerState<AppBlockingScreen> createState() => _AppBlockingScreenState();
}

class _AppBlockingScreenState extends ConsumerState<AppBlockingScreen> {
  StreamSubscription? navigationSubscription;
  @override
  void initState() {
    super.initState();
    navigationSubscription = ref
        .read(appblockingscreenprovider)
        .navigationStream
        .stream
        .listen((event) {
      if (event is NavigatorPush) {
        context.push(
          pageConfig: event.pageConfig,
          data: event.data,
        );
      } else if (event is NavigatorPop) {
        ref.read(focusModeProvider).updateAppDetail();
        context.pop(data: event.data);
      } else if (event is NavigatorPopAndPush) {
        context.popAndPush(pageConfig: event.pageConfig, data: event.data);
      }
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
    final vm = ref.watch(appblockingscreenprovider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: double.infinity,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: ResponsiveUI.w(25, context),
            ),
            GestureDetector(
              onTap: () {
                vm.navigatePop();
              },
              child: Image.asset(
                'lib/Helpers/Images/backIcon.png',
                width: ResponsiveUI.w(9, context),
                height: ResponsiveUI.h(13, context),
              ),
            ),
            SizedBox(
              width: ResponsiveUI.w(93, context),
            ),
            Text(
              lang.appBlocking,
              style: TextStyle(
                  fontFamily: 'SFProRounded',
                  fontSize: ResponsiveUI.sp(20, context),
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(
            left: ResponsiveUI.w(22, context),
            right: ResponsiveUI.w(22, context),
            top: ResponsiveUI.h(22, context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: ResponsiveUI.h(12, context),
                  horizontal: ResponsiveUI.w(12, context)),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(ResponsiveUI.r(8, context)),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: ResponsiveUI.r(5, context),
                        spreadRadius: ResponsiveUI.r(1, context),
                        color: Colors.black.withOpacity(0.25))
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    lang.enableSmartBlocking,
                    style: TextStyle(
                        fontFamily: 'SFPro',
                        fontWeight: FontWeight.w600,
                        fontSize: ResponsiveUI.sp(
                            LocaleUtils.isTamil(context) ? 15 : 17, context)),
                  ),
                  Container(
                      child: ToggleSwitch(
                          height: 32,
                          width: 60,
                          value: vm.getSmartBlockState(),
                          onChange: vm.changeSMartBlockState)),
                ],
              ),
            ),
            SizedBox(
              height: ResponsiveUI.h(52, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  lang.blockedApps,
                  style: TextStyle(
                      fontFamily: 'SFPro',
                      fontSize: ResponsiveUI.sp(
                          LocaleUtils.isTamil(context) ? 15 : 18, context),
                      fontWeight: FontWeight.w700),
                ),
                GestureDetector(
                  onTap: () {
                    vm.navigateToAppSelectionScreen();
                  },
                  child: Text(
                    lang.addApp,
                    style: TextStyle(
                        fontFamily: 'SFPro',
                        fontSize: ResponsiveUI.sp(
                            LocaleUtils.isTamil(context) ? 13 : 16, context),
                        fontWeight: FontWeight.w600,
                        color: Color(0xff7871E4)),
                  ),
                )
              ],
            ),
            SizedBox(
              height: ResponsiveUI.h(23, context),
            ),
            SizedBox(
              height: ResponsiveUI.h(250, context),
              child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: vm.blockedAppsList.length,
                  itemBuilder: (context, index) {
                    return BlockedAppsList(
                      appInfo: vm.blockedAppsList[index],
                      toggleValue: vm.getToggleState(
                          vm.blockedAppsList[index].packageName),
                      onChange: () {
                        vm.changeToggle(
                          vm.blockedAppsList[index].packageName,
                        );
                      },
                    );
                  }),
            ),
            SizedBox(
              height: ResponsiveUI.h(50, context),
            ),
            Text(
              lang.blockingRules,
              style: TextStyle(
                  fontFamily: 'SFPro',
                  fontSize: ResponsiveUI.sp(
                      LocaleUtils.isTamil(context) ? 15 : 18, context),
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: ResponsiveUI.h(27, context),
            ),
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: ResponsiveUI.w(16, context),
                    vertical: ResponsiveUI.h(16, context)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(ResponsiveUI.r(8, context)),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: ResponsiveUI.r(5, context),
                          spreadRadius: ResponsiveUI.r(1, context),
                          color: Colors.black.withOpacity(0.15))
                    ]),
                child: Column(
                  children: [
                    BlockingRules(
                      title: lang.blockDuringFocusHours,
                      subtitle: 'Mon - Fri | 9:00 AM - 2:00 PM',
                      image: 'lib/Helpers/Images/Calendar.png',
                    ),
                    const Divider(
                      color: Color(0xffF3F3FA),
                      thickness: 1,
                      height: 20,
                      indent: 10,
                      endIndent: 10,
                    ),
                    BlockingRules(
                        title: lang.dailyUsageLimit,
                        subtitle: '2h 40m per day',
                        image: 'lib/Helpers/Images/timer.png'),
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
