// ignore_for_file: unused_local_variable, unused_import, deprecated_member_use, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cookbook/Helpers/Responsive.dart';
import 'package:cookbook/Pages/HomeScreen/HomeScreenVM.dart';
import 'package:cookbook/Pages/HomeScreen/LocalReusables/ElevatedHomeScreenContainer.dart';
import 'package:cookbook/Pages/HomeScreen/LocalReusables/QuickStartContainer.dart';
import 'package:cookbook/Pages/MainScreen/MainScreenVM.dart';
import 'package:cookbook/Pages/Reusables/CircularIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_fonts/google_fonts.dart';

class HomeScreen
    extends ConsumerWidget {

  const HomeScreen({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {

    final vm =
        ref.watch(homeScreenProvider);


    return Scaffold(
      backgroundColor: Color(0xFFFDFDFE),
      body:SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: ResponsiveUI.w(20, context))  ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: ResponsiveUI.h(10, context)),

Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,

  children: [

    Image.asset(
      "lib/Helpers/Images/MenuIcon.png",

      height: ResponsiveUI.h(25, context),
      width: ResponsiveUI.w(25, context),
    ),

    Image.asset(
      "lib/Helpers/Images/NotificationIcon.png",

      height: ResponsiveUI.h(20, context),
      width: ResponsiveUI.w(25, context),
    ),
  ],
),

SizedBox(height: ResponsiveUI.h(24, context)),
                Text('Good Morning,',style: GoogleFonts.inter(
                  fontSize: ResponsiveUI.sp(20, context),
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF000000)
            
                ),),
                Row(
                  children: [
                    Text('Karthick Manickam',style: GoogleFonts.inter(
                  fontSize: ResponsiveUI.sp(20, context),
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF000000)
            
                ),),
                    Image.asset(
                      "lib/Helpers/Images/waveIcon.png",
                      height: ResponsiveUI.h(27.29,context),
                      width: ResponsiveUI.w(25, context),
                    )
                  ],
                ), 
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: ResponsiveUI.h(18, context)),
                  child: const FocusScoreWidget(focusScore: 74.0),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Elevatedhomescreencontainer(isfocusTime: true,),
                    Elevatedhomescreencontainer(isfocusTime: false,),
                  ],
                ),
                
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: ResponsiveUI.h(26,context)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(ResponsiveUI.r(32, context)),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children:[ 
                        Container(
                        padding: EdgeInsets.symmetric(horizontal: ResponsiveUI.w(19, context),vertical: ResponsiveUI.h(30, context)),
                        width: ResponsiveUI.w(351, context),
                        decoration: BoxDecoration(
                          
                          boxShadow: [
                            BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: ResponsiveUI.r(20, context),
                            offset: Offset(0, ResponsiveUI.h(4, context)),
                            spreadRadius: 0,
                            
                          ),],
                          border: Border.all(
                            color: Colors.black,
                            width: ResponsiveUI.w(1, context),
                          ),
                          color: Color(0xFF5041EC),
                          borderRadius: BorderRadius.circular(ResponsiveUI.r(32, context)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('You\'ve been Inactive',style: GoogleFonts.roboto(
                              fontSize: ResponsiveUI.sp(15, context),
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),),
                            Padding(
                              padding:  EdgeInsets.only(bottom: ResponsiveUI.h(12, context),top: ResponsiveUI.h(4, context)),
                              child: Text('for 15 min',style: GoogleFonts.inter(
                                fontSize: ResponsiveUI.sp(18, context),
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),),
                            ),
                            
                            Text('Time for a short break?',style: GoogleFonts.roboto(
                              fontSize: ResponsiveUI.sp(13, context),
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),)
                          ],
                        ),
                      ),
                      Positioned(
                        right: ResponsiveUI.w(-115, context),
                        top: ResponsiveUI.h(-25, context),
                        child: Image.asset(
                          "lib/Helpers/Images/breakImage.png",
                          height: ResponsiveUI.h(230, context), 
                        ),
                      ),
                      ]
                    ),
                  ),
                ),
              
                Text('Quick Start',style: TextStyle(
                  fontFamily: 'SFProRounded',
                  fontSize: ResponsiveUI.sp(16, context),
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF000000)
                ),),
                SizedBox(height: ResponsiveUI.h(13, context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    QuickStartContainer(colorCode: Color(0xff5041EC), text: 'Start Focus', image: "lib/Helpers/Images/startFocusIcon.png"),
                    QuickStartContainer(colorCode: Color(0xff1CA286), text: 'Take a Break', image: "lib/Helpers/Images/takeaBreakIcon.png"),
                  ],
                ),
                SizedBox(height: ResponsiveUI.h(27, context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}