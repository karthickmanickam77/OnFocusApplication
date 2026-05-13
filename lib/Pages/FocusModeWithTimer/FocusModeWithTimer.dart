import 'package:cookbook/Helpers/AppNavigations/NavigationHelpers.dart';
import 'package:cookbook/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:cookbook/Helpers/Responsive.dart';
import 'package:cookbook/Pages/FocusModeWithTimer/FocusModeWithTimerVM.dart';
import 'package:cookbook/Pages/Reusables/ReusableFocusTimer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class FocusModeWithTimer extends ConsumerStatefulWidget {
  const FocusModeWithTimer({super.key});

  @override
  ConsumerState<FocusModeWithTimer> createState() => _FocusModeWithTimer();
}

class _FocusModeWithTimer extends ConsumerState<FocusModeWithTimer> {
  @override
  void initState() {
    super.initState();

    ref
        .read(focusModeWithTimerProvider)
        .navigationStream
        .stream
        .listen((event) {
      if (event is NavigatorPop) {
        context.pop(
          data: event.data,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(focusModeWithTimerProvider);
    return Scaffold(
      backgroundColor: Color(0xff080E1B),
      appBar: AppBar(
        backgroundColor: Color(0xff080E1B),
        leadingWidth: double.infinity,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Deep Work',
              style: GoogleFonts.inter(
                  fontSize: ResponsiveUI.sp(19, context),
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              width: ResponsiveUI.w(65, context),
            ),
            SizedBox(
              width: ResponsiveUI.w(42, context),
              height: ResponsiveUI.h(18, context),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffD9D9D9),
                      padding: EdgeInsets.symmetric(
                          vertical: ResponsiveUI.h(3, context)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              ResponsiveUI.r(8, context)))),
                  onPressed: () {
                    vm.navigationPop();
                  },
                  child: Text(
                    'End',
                    style: GoogleFonts.inter(
                        fontSize: ResponsiveUI.sp(10, context),
                        color: Color(0xffF55745),
                        fontWeight: FontWeight.w700),
                  )),
            ),
            SizedBox(
              width: ResponsiveUI.w(29, context),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: ResponsiveUI.h(50, context),
              ),
              ReusableFocusTimer(
                  currentValue:
                      (vm.remainingSeconds / 60).clamp(1, 25).toDouble(),
                  maxValue: 25,
                  formattedTime: vm.getFormattedTime(),
                  title: 'Focus Time',
                  isEditable: false,
                  onChanged: (value) =>
                      ref.read(focusModeWithTimerProvider).changeTimer(value)),
              SizedBox(
                height: ResponsiveUI.h(24, context),
              ),
              Text(
                'Stay focused, you\'re doing great!',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: ResponsiveUI.sp(17, context),
                    color: Colors.white),
              ),
              SizedBox(
                height: ResponsiveUI.h(95, context),
              ),
              Container(
                width: ResponsiveUI.w(70, context),
                height: ResponsiveUI.h(70, context),
                decoration: BoxDecoration(
                    color: Color(0xff1B202E),
                    borderRadius:
                        BorderRadius.circular(ResponsiveUI.r(70, context))),
                child: Center(
                  child: SizedBox(
                    width: ResponsiveUI.w(45, context),
                    height: ResponsiveUI.h(45, context),
                    child: Image.asset(
                      "lib/Helpers/Images/mute.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ResponsiveUI.h(107, context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "lib/Helpers/Images/Lock.png",
                    width: ResponsiveUI.w(30, context),
                  ),
                  SizedBox(
                    width: ResponsiveUI.w(11, context),
                  ),
                  Text(
                    'Apps are blocked',
                    style: TextStyle(
                        fontFamily: 'SFProRounded',
                        fontSize: ResponsiveUI.sp(19, context),
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
