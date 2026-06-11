import 'dart:typed_data';

import 'package:cookbook/BOs/BlockedAppBO/BlockedAppBO.dart';
import 'package:cookbook/Helpers/Responsive.dart';
import 'package:flutter/material.dart';

class Reusableblockedappslist extends StatelessWidget {
  Function()? onRemove;
  BlockedAppBO appDetail;
  Reusableblockedappslist({super.key, this.onRemove, required this.appDetail});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            (appDetail.icon!=null)?Image.memory(
              Uint8List.fromList(appDetail.icon ?? []),
              height: ResponsiveUI.h(32, context),
              width: ResponsiveUI.w(32, context),
            ):Icon(Icons.android),
            
            SizedBox(
              width: ResponsiveUI.w(16, context),
            ),
            Text(
              appDetail.appName,
              style: TextStyle(
                fontFamily: 'SF Pro',
                color: Colors.black,
                fontSize: ResponsiveUI.sp(16, context),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: onRemove,
          child: Image.asset(
            'lib/Helpers/Images/removeIcon.png',
            width: ResponsiveUI.w(40, context),
          ),
        )
      ],
    );
  }
}
