// FocusModeVM.dart

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'FocusModeModel.dart';



final focusModeProvider =
    ChangeNotifierProvider(
        (ref) => FocusModeVM());



class FocusModeVM
    extends FocusModeModel
    with ChangeNotifier {

  Timer? timer;



  FocusModeVM() {

    initialize();
  }



  void initialize() {

    setTotalSeconds(25 * 60);

    setRemainingSeconds(25 * 60);

    setIsRunning(false);
  }



  void startTimer() {

    if (isRunning) return;

    setIsRunning(true);

    notifyListeners();



    timer = Timer.periodic(

      Duration(seconds: 1),

      (timer) {

        if (remainingSeconds > 0) {

          setRemainingSeconds(
              remainingSeconds - 1);

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
 int seconds =
      (value * 60).toInt();
  setRemainingSeconds(
      seconds.toInt());

  setTotalSeconds(
      seconds.toInt());

  notifyListeners();
}

  String getFormattedTime() {

    final minutes =
        (remainingSeconds ~/ 60)
            .toString();

    final seconds =
        (remainingSeconds % 60)
            .toString()
            .padLeft(2, '0');

    return '$minutes:$seconds';
  }
}