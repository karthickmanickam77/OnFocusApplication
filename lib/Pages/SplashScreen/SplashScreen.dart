import 'dart:async';

import 'package:cookbook/Helpers/AppNavigations/NavigationHelpers.dart';
import 'package:cookbook/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:cookbook/Pages/SplashScreen/SplashScreenVM.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  StreamSubscription? navigationsubscription;
  @override
  void initState() {
    super.initState();
    navigationsubscription =
        ref.read(splashscreenprovider).navigationStream.stream.listen((event) {
      if (event is NavigatorPush) {
        context.push(
          pageConfig: event.pageConfig,
          data: event.data,
        );
      } else if (event is NavigatorPop) {
        context.pop();
      } else if (event is NavigatorPopAndPush) {
        context.popAndPush(pageConfig: event.pageConfig);
      }
    });
  }

  @override
  void dispose() {
    navigationsubscription?.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final vm = ref.watch(splashscreenprovider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.transparent,
        child: Center(
          child: Image.asset(
            "lib/Helpers/GIFs/splash_screen_gif.gif",
            gaplessPlayback: true,
          ),
        ),
      ),
    );
  }
}
