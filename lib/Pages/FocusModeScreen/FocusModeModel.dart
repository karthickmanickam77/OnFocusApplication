// FocusModeModel.dart

import 'package:cookbook/BOs/AppsBO/ApplicationBO.dart';
import 'package:cookbook/BOs/BlockedAppBO/BlockedAppBO.dart';
import 'package:cookbook/Services/Device%20Services/IsarServices/IIsarService.dart';
import 'package:cookbook/Services/Device%20Services/NativeBlockerService/INativeBlockerService.dart';
import 'package:get_it/get_it.dart';

class FocusModeModel {
  final db = GetIt.I<IIsarService>();
  final INativeBlockerService appblocker = GetIt.I<INativeBlockerService>();
  int _totalSeconds = 1500;

  int _remainingSeconds = 1500;

  bool _isRunning = false;
  List<BlockedAppBO> blockedApps = [];


  int get totalSeconds => _totalSeconds;

  int get remainingSeconds => _remainingSeconds;

  bool get isRunning => _isRunning;

  void setBlockedApps(List<BlockedAppBO> apps){
    blockedApps=apps;
  }

  void setTotalSeconds(int value) {

    _totalSeconds = value;
  }

  void setRemainingSeconds(int value) {

    _remainingSeconds = value;
  }

  void setIsRunning(bool value) {

    _isRunning = value;
  }
}