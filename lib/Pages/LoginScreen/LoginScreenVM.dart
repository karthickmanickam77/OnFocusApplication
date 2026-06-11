import 'package:cookbook/Pages/LoginScreen/LoginScreenModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginScreenProvider = ChangeNotifierProvider((ref) => LoginScreenVM());

class LoginScreenVM extends LoginScreenModel with ChangeNotifier {
  LoginScreenVM() {
    // Initialize any necessary data or perform setup tasks here
  }
}
