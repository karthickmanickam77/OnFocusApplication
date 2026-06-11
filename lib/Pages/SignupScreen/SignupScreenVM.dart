import 'package:cookbook/Pages/SignupScreen/SignupScreenModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signupScreenProvider = ChangeNotifierProvider((ref) => SignupScreenVM());

class SignupScreenVM extends SignupScreenModel with ChangeNotifier {
  SignupScreenVM() {
    // Initialize any necessary data or perform setup tasks here
  }
}
