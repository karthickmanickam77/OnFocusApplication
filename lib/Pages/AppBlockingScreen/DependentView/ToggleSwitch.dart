import 'package:cookbook/Helpers/Responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ToggleSwitch extends StatelessWidget {
  final int height;
  final int width;
  final bool value;
  final VoidCallback onChange;
  ToggleSwitch(
      {super.key,
      required this.height,
      required this.width,
      required this.value,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      onToggle: (val) {
        onChange();
      },
      width: ResponsiveUI.w(width.toDouble(), context),
      height: ResponsiveUI.h(height.toDouble(), context),
      valueFontSize: 0.0,
      activeColor: Color(0xff6563FF),
      inactiveColor: Color(0xffB2B1FF),
      activeToggleColor: Color(0xffB2B1FF),
      inactiveToggleColor: Color(0xff6563FF),
      toggleSize: ResponsiveUI.r(18, context),
      value: value,
      borderRadius: 30.0,
      padding: 8.0,
      showOnOff: false,
    );
  }
}
