// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cookbook/Pages/LoginScreen/LoginScreenVM.dart';
import 'package:cookbook/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginScreenVM _loginScreenVM = LoginScreenVM();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.red,
        ),
      ),
    ));
  }
}
