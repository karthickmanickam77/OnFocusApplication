class FocusModeWithTimerModel {
  // FocusModeModel.dart

  int _totalSeconds = 1500;

  int _remainingSeconds = 1500;

  bool _isRunning = true;

  int get totalSeconds => _totalSeconds;

  int get remainingSeconds => _remainingSeconds;

  bool get isRunning => _isRunning;

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
