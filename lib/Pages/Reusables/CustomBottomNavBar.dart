import 'package:cookbook/BOs/CustomBottomNavElement/BottomNavElementBO.dart';
import 'package:cookbook/Helpers/Responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomBar extends StatelessWidget {

  final int currentIndex;
  final List<BottomNavElementBO> elements;
  final Function(int) onTap;

  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.elements
  });

  @override
  Widget build(BuildContext context) {


    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFDFDFE),
        border: Border(
          top: BorderSide(
            color: Color(0xFFE4E4E5),
            width: ResponsiveUI.w(1, context)
          )
        )
      ),
      height: ResponsiveUI.h(70, context),
      

      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceAround,

        children: List.generate(
          elements.length,
          (index) {

            bool isSelected =
                currentIndex == index;

            return GestureDetector(
              onTap: () => onTap(index),

              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [

                  Image.asset(
                    elements[index].image,
                    height: ResponsiveUI.h(20, context),
                    width: ResponsiveUI.w(20, context),
                    color: isSelected
                        ? Color(0xFF4735E5)
                          : Color(0xFF686973),
                  ),
                  SizedBox(
                    height: ResponsiveUI.h(5, context),
                  ),
                  Text(
                    elements[index].name,
                    style: GoogleFonts.inter(
                      fontSize: ResponsiveUI.sp(12, context),
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? Color(0xFF4735E5)
                          : Color(0xFF686973),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}