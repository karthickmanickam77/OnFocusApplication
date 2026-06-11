import 'package:cookbook/Helpers/Responsive.dart';
import 'package:flutter/material.dart';

class AuthenticationButton extends StatelessWidget {
  final Function onPressed;
  String text;
  AuthenticationButton(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: ResponsiveUI.h(58, context),
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4B3CF0),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              ResponsiveUI.r(18, context),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'SPFProRounded',
            fontSize: ResponsiveUI.sp(18, context),
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
