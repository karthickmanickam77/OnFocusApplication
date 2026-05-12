import 'package:flutter/material.dart';

class ResponsiveUI {
  static num? baseWidth;
  static num? baseHeight;
  static w(double width, BuildContext context) {
    double percentage = (width * 100) / baseWidth!;
    return ((MediaQuery.of(context).size.width) * (percentage)) / 100;
  }

  static h(double height, BuildContext context) {
    double percentage = (height * 100) / baseHeight!;
    return ((MediaQuery.of(context).size.height) * (percentage)) / 100;
  }

  static sp(double size, BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double scaleFactor = screenWidth / baseWidth!;
    return size * scaleFactor;
  }

  static r(double radius, BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    double widthScaleFactor = screenWidth / baseWidth!;
    double heightScaleFactor = screenheight / baseHeight!;
    double scaleFactor = (widthScaleFactor + heightScaleFactor) / 2.0;
    return radius * scaleFactor;
  }
}
