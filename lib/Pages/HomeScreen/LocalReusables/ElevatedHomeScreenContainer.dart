import 'package:cookbook/Helpers/Responsive.dart';
import 'package:flutter/material.dart';

class Elevatedhomescreencontainer extends StatelessWidget{

  final bool isfocusTime;
  const Elevatedhomescreencontainer({
    required this.isfocusTime,
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: ResponsiveUI.w(9, context),top: ResponsiveUI.h(14, context),bottom: ResponsiveUI.h(10, context)),
                      // height: ResponsiveUI.h(106,context),
                      width: ResponsiveUI.w(165, context),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(ResponsiveUI.r(16, context)),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF000000).withOpacity(0.08),
                            blurRadius: ResponsiveUI.r(16, context),
                            offset: Offset(0, 4),
                            spreadRadius: ResponsiveUI.r(0, context),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: ResponsiveUI.h(20, context),
                                width: ResponsiveUI.w(20, context),
                          
                                decoration: BoxDecoration(
                                  color: isfocusTime?Color(0xFF1CAB88):Color(0xFFFD5544),
                                  borderRadius: BorderRadius.circular(ResponsiveUI.r(4, context)),
                                ),
                                child: Center(
                                  child: Container(
                                    height: ResponsiveUI.h(14,context),
                                    width: ResponsiveUI.w(14, context),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                       width: ResponsiveUI.w(0.9, context),
                                      ),
                                      color: Colors.transparent,
                                      
                                  ),
                                  ),
                                ),
                              ),
                                 SizedBox(width: ResponsiveUI.w(3, context)),
                                                             Text(
                            isfocusTime?"Focused Time":"Distracted Time",
                            style: TextStyle(
                              fontFamily: 'SF Pro',
                              fontSize: ResponsiveUI.sp(14, context),
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                            ],
                          ),
                          SizedBox(height: ResponsiveUI.h(4, context)),
                          Text('3h 20m',style: TextStyle(
                                fontFamily: 'SF Pro',
                                fontSize: ResponsiveUI.sp(25, context),
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),),
                              SizedBox(height: ResponsiveUI.h(4, context)),
                              Row(
                                children: [
                                  Image.asset(
                                    isfocusTime?"lib/Helpers/Images/arrowup.png":"lib/Helpers/Images/arrowdown.png",
                                    height: ResponsiveUI.h(15, context),
                                    width: ResponsiveUI.w(15, context),
                                  ),
                                  SizedBox(width: ResponsiveUI.w(4, context)),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                         TextSpan(
                                          text: isfocusTime? '5% ': '3% ',
                                          style: TextStyle(
                                            fontFamily: 'SFProRounded',
                                            fontSize: ResponsiveUI.sp(12, context),
                                            fontWeight: FontWeight.w700,
                                            color: isfocusTime?Color(0xFF34D92B):Color(0xFFF94649),
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' vs yesterday',
                                          style: TextStyle(
                                            fontFamily: 'SFProRounded',
                                            fontSize: ResponsiveUI.sp(12, context),
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFFFAAACB8),
                                          ),
                                        ),
                                      ],
                                     
                                  )
                                  )
                                ],
                              )
                        ],
                      )
                    );
  }
}