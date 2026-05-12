import 'package:cookbook/Helpers/Responsive.dart';
import 'package:flutter/material.dart';

class Reusableblockedappslist extends StatelessWidget {
  const Reusableblockedappslist({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset('lib/Helpers/Images/instagram.png',
                width: ResponsiveUI.w(32, context)),
            SizedBox(
              width: ResponsiveUI.w(16, context),
            ),
            Text(
              'Instagram',
              style: TextStyle(
                fontFamily: 'SF Pro',
                color: Colors.black,
                fontSize: ResponsiveUI.sp(16, context),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Image.asset(
          'lib/Helpers/Images/removeIcon.png',
          width: ResponsiveUI.w(40, context),
        )
      ],
    );
  }
}
