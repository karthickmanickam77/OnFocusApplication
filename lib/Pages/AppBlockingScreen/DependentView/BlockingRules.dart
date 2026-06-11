import 'package:cookbook/Helpers/Responsive.dart';
import 'package:flutter/material.dart';

class BlockingRules extends StatelessWidget {
  String image;
  String title;
  String subtitle;
  BlockingRules(
      {super.key,
      required this.image,
      required this.subtitle,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: ResponsiveUI.w(16, context),
        ),
        Image.asset(
          image,
          height: ResponsiveUI.h(25, context),
          width: ResponsiveUI.w(25, context),
        ),
        SizedBox(
          width: ResponsiveUI.w(26, context),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                title,
                style: TextStyle(
                    fontFamily: 'SFPro',
                    fontWeight: FontWeight.w600,
                    fontSize: ResponsiveUI.sp(15, context),
                    color: Colors.black),
              ),
              SizedBox(
                height: ResponsiveUI.h(11, context),
              ),
              Text(
                subtitle,
                style: TextStyle(
                    fontFamily: 'SFPro',
                    fontWeight: FontWeight.w600,
                    fontSize: ResponsiveUI.sp(12, context),
                    color: Color(0xff7C7A96)),
              )
            ],
          ),
        ),
        // Spacer(),
        Icon(Icons.navigate_next),
        SizedBox(
          width: ResponsiveUI.w(16, context),
        )
      ],
    );
  }
}
