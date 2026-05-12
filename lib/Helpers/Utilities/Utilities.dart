import 'package:flutter/material.dart';

extension ExceptionalHandling on Object {
  void writeExceptionData() {
    try {
      debugPrint("*--_-- Exception --_--*");
      debugPrint(this.toString());
      debugPrint("* --_-- --_--*");
    } catch (error) {
      debugPrint("*--_-- Exception --_--*");
      debugPrint(this.toString());
      debugPrint("* --_-- --_--*");
    }
  }
}
