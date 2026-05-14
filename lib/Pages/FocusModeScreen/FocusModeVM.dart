// FocusModeVM.dart

import 'dart:async';

import 'package:cookbook/BOs/AppsBO/ApplicationBO.dart';
import 'package:cookbook/Helpers/AppNavigations/NavigationConfig.dart';
import 'package:cookbook/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'FocusModeModel.dart';

final focusModeProvider = ChangeNotifierProvider((ref) => FocusModeVM());

class FocusModeVM extends FocusModeModel with ChangeNotifier, NavigationMixin {
  Timer? timer;

  FocusModeVM() {
    initialize();
  }

  void initialize() {
    setTotalSeconds(25 * 60);

    setRemainingSeconds(25 * 60);

    setIsRunning(false);

    setBlockedApps([
      ApplicationBO(applogo: 'assets/instagram.png', appname: 'Instagram'),
      ApplicationBO(applogo: 'assets/facebook.png', appname: 'Facebook'),
      ApplicationBO(applogo: 'assets/twitter.png', appname: 'Twitter'),
    ]);
  }

  void navigationToTimerScreen() {
    addNavigationToStream(
        navigate: NavigatorPush(
            pageConfig: Pages.focusModeWithTimePageConfig, data: null));
    // dispose();
    notifyListeners();
  }

  void dispose() {
    disposeNavigationMixin();
    super.dispose();
  }

  void startTimer() {
    if (isRunning) return;

    setIsRunning(true);

    notifyListeners();

    timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (remainingSeconds > 0) {
          setRemainingSeconds(remainingSeconds - 1);

          notifyListeners();
        } else {
          stopTimer();
        }
      },
    );
  }

  void removeBlockedApps(int index) {
    blockedApps.removeAt(index);
    notifyListeners();
  }

  void stopTimer() {
    timer?.cancel();

    setIsRunning(false);

    notifyListeners();
  }

  void resetTimer() {
    stopTimer();

    setRemainingSeconds(totalSeconds);

    notifyListeners();
  }

  List<ApplicationBO> getBlockedApps() {
    return blockedApps;
  }

  void changeTimer(double value) {
    int seconds = (value * 60).toInt();
    setRemainingSeconds(seconds.toInt());

    setTotalSeconds(seconds.toInt());

    notifyListeners();
  }

  String getFormattedTime() {
    final minutes = (remainingSeconds ~/ 60).toString();

    final seconds = (remainingSeconds % 60).toString().padLeft(2, '0');

    return '$minutes:$seconds';
  }
}
