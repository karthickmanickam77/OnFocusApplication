import 'package:cookbook/Helpers/Language_Localization/app_localizations.dart';
import 'package:cookbook/Helpers/Responsive.dart';
import 'package:cookbook/Pages/LoginScreen/LoginScreenVM.dart';
import 'package:cookbook/Pages/Reusables/AuthenticationButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(loginScreenProvider);
    final lang = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveUI.w(24, context),
        ),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'lib/Helpers/Images/focus_app_Icon.png',
                height: ResponsiveUI.h(80, context),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontFamily: 'SFProRounded',
                    fontSize: ResponsiveUI.sp(26, context),
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: ResponsiveUI.w(4, context),
                ),
                Image.asset(
                  'lib/Helpers/Images/waveIcon.png',
                  // height: ResponsiveUI.h(40, context),
                  width: ResponsiveUI.w(40, context),
                ),
              ],
            ),
            SizedBox(
              height: ResponsiveUI.h(8, context),
            ),
            Center(
              child: Text('Login to continue your journey',
                  style: TextStyle(
                    fontFamily: 'SFProRounded',
                    fontSize: ResponsiveUI.sp(14, context),
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(0.6),
                  )),
            ),
            Center(
              child: Text('towards a better you',
                  style: TextStyle(
                    fontFamily: 'SFProRounded',
                    fontSize: ResponsiveUI.sp(14, context),
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(0.6),
                  )),
            ),
            Text('Email'),
            TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                suffixIcon: Icon(Icons.email_outlined),
              ),
            ),
            SizedBox(
              height: ResponsiveUI.h(12, context),
            ),
            Text('Password'),
            TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                suffixIcon: Icon(Icons.lock_outlined),
              ),
            ),
            SizedBox(
              height: ResponsiveUI.h(12, context),
            ),
            Text(
              'Forgot Password?',
              style: TextStyle(
                fontFamily: 'SFProRounded',
                fontSize: ResponsiveUI.sp(14, context),
                fontWeight: FontWeight.w700,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            SizedBox(
              height: ResponsiveUI.h(22, context),
            ),
            AuthenticationButton(onPressed: () {}, text: 'Login'),
          ],
        ),
      )),
    );
  }
}
