import 'dart:async';

abstract class ISnackBar {}

class ShowSnackBarWithoutAction<T> extends ISnackBar {
  String snackBarText;
  ShowSnackBarWithoutAction({required this.snackBarText});
}

mixin SnackBarMixin {
  StreamController<ISnackBar> snackbarcontroller =
      StreamController<ISnackBar>();
  void setSnackBarEvent({required ISnackBar event}) {
    snackbarcontroller.add(event);
  }

  void closeSnackBarMixin() async {
    await snackbarcontroller.close();
  }
}

class ShowSnackBarWithAction<T> extends ISnackBar {
  String snackBarText;
  String ButtonText;
  T function;
  ShowSnackBarWithAction(
      {required this.snackBarText,
      required this.ButtonText,
      required this.function});
}

mixin SnackBarMixins {
  StreamController<ISnackBar> snackbarController =
      StreamController<ISnackBar>();

  void setSnackBarEvents({required ISnackBar event}) {
    snackbarController.add(event);
  }

  void closeSnackBarMixins() async {
    await snackbarController.close();
  }
}
