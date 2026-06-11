import 'dart:typed_data';

import 'package:cookbook/BOs/BlockedAppBO/BlockedAppBO.dart';
import 'package:cookbook/Helpers/Responsive.dart';
import 'package:cookbook/Pages/AppBlockingScreen/DependentView/ToggleSwitch.dart';
import 'package:flutter/material.dart';

class BlockedAppsList extends StatelessWidget {
  bool toggleValue;
  final VoidCallback onChange;
  BlockedAppBO appInfo;
  BlockedAppsList(
      {super.key, required this.toggleValue, required this.onChange,required this.appInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (appInfo.icon!=null)?Image.memory(
              Uint8List.fromList(appInfo.icon ?? []),
              height: ResponsiveUI.h(35, context),
              width: ResponsiveUI.w(35, context),
            ):Icon(Icons.android),
            SizedBox(
              width: ResponsiveUI.w(16, context),
            ),
            Text(
              appInfo.appName,
              style: TextStyle(
                  fontFamily: 'SFPro',
                  fontSize: ResponsiveUI.sp(18, context),
                  fontWeight: FontWeight.w600,
                  color: Color(0xff000000)),
            ),
            Expanded(child: SizedBox()),
            ToggleSwitch(
                height: 27, width: 50, value: toggleValue, onChange: onChange)
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              left: ResponsiveUI.w(50, context),
              top: ResponsiveUI.h(5, context)),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(
              width: ResponsiveUI.w(1, context),
              color: Color(0xfff3f3fa),
            )),
          ),
        ),
        SizedBox(
          height: ResponsiveUI.h(12, context),
        )
      ],
    );
  }
}
