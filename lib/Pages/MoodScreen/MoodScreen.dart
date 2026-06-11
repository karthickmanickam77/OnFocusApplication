import 'dart:async';

import 'package:cookbook/Helpers/AppNavigations/NavigationHelpers.dart';
import 'package:cookbook/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:cookbook/Helpers/Language_Localization/app_localizations.dart';
import 'package:cookbook/Helpers/Responsive.dart';
import 'package:cookbook/Helpers/Utilities/Extensions/MoodTypeExtension.dart';
import 'package:cookbook/Pages/MoodScreen/MoodScreenVM.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoodScreen extends ConsumerStatefulWidget {
  const MoodScreen({super.key});

  @override
  ConsumerState<MoodScreen> createState() => _MoodScreenState();
}

class _MoodScreenState extends ConsumerState<MoodScreen> {
  StreamSubscription? navigationsubscription;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(
      viewportFraction: 0.77,
    );
    navigationsubscription =
        ref.read(moodscreenprovider).navigationStream.stream.listen((event) {
      if (event is NavigatorPush) {
        context.push(
          pageConfig: event.pageConfig,
          data: event.data,
        );
      } else if (event is NavigatorPop) {
        context.pop();
      }
    });
  }

  @override
  void dispose() {
    navigationsubscription?.cancel();
    pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    final vm = ref.watch(moodscreenprovider);
    return Scaffold(
      backgroundColor: Color(0xffFAFAFC),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              lang.whatsYourMoodToday,
              style: TextStyle(
                  fontFamily: 'SFProRounded',
                  fontSize: ResponsiveUI.sp(30, context),
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            Container(
              height: ResponsiveUI.h(550, context),
              width: double.infinity,
              child: PageView.builder(
                controller: pageController,
                scrollDirection: Axis.horizontal,
                itemCount: vm.moodList.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      // OUTER GLOW
                      Container(
                        height: ResponsiveUI.h(220, context),
                        width: ResponsiveUI.w(220, context),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  vm.moodList[index].outergradientcolors.first,
                              blurRadius: ResponsiveUI.r(180, context),
                              spreadRadius: ResponsiveUI.r(40, context),
                            ),
                            BoxShadow(
                              color:
                                  vm.moodList[index].outergradientcolors.last,
                              blurRadius: ResponsiveUI.r(100, context),
                              spreadRadius: ResponsiveUI.r(40, context),
                            ),
                          ],
                        ),
                      ),

                      // INNER CIRCLE
                      Container(
                        height: ResponsiveUI.h(250, context),
                        width: ResponsiveUI.w(250, context),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white.withOpacity(0.5),
                            width: ResponsiveUI.w(1, context),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: vm.moodList[index].innergradientcolors,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            vm.moodList[index].mood.title(context),
                            style: TextStyle(
                                fontFamily: 'SFProRounded',
                                fontWeight: FontWeight.w700,
                                fontSize: ResponsiveUI.sp(25, context),
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  vm.navigationDecider();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff5140F2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            ResponsiveUI.r(16, context)))),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveUI.w(45, context),
                      vertical: ResponsiveUI.h(15, context)),
                  child: Text(
                    lang.continueButton,
                    style: TextStyle(
                        fontFamily: 'SFProRounded',
                        fontSize: ResponsiveUI.sp(18, context),
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
