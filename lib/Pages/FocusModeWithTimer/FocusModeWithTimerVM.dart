import 'dart:async';
import 'package:cookbook/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:cookbook/Pages/FocusModeWithTimer/FocusModeWithTimerModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final focusModeWithTimerProvider =
    ChangeNotifierProvider.autoDispose<FocusModeWithTimerVM>(
        (ref) => FocusModeWithTimerVM());

class FocusModeWithTimerVM extends FocusModeWithTimerModel
    with ChangeNotifier, NavigationMixin {
  Timer? timer;

  FocusModeWithTimerVM() {
    initialize();
    startTimer();
  }

  void initialize() {
    setTotalSeconds(25 * 60);

    setRemainingSeconds(25 * 60);

    setIsRunning(false);
  }

  void navigationPop() {
    addNavigationToStream(navigate: NavigatorPop(data: null));
    timer?.cancel();

    // disposeNavigationMixin();
    // dispose();
    notifyListeners();
  }

  void dispose() {
    super.dispose();
    disposeNavigationMixin();
    notifyListeners();
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
