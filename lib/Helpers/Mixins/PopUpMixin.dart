import 'dart:async';

abstract class IPopUp {}

class ShowPopupWithSingleAction<T> extends IPopUp {
  String popupName;
  String? description;
  String? iconUrl;
  String buttonText;
  T function;
  ShowPopupWithSingleAction(
      {required this.popupName,
      required this.buttonText,
      required this.function,
      this.description,
      this.iconUrl});
}

mixin PopUpMixin {
  StreamController<IPopUp> popUpController = StreamController<IPopUp>.broadcast();
  void setPopupEvent({required IPopUp event}) {
    popUpController.add(event);
  }

  void closePopUpMixin() async {
    await popUpController.close();
  }
}

class ShowPopupWithMultiAction<T> extends IPopUp {
  String popupName;
  String? description;
  String? iconUrl;
  List<String> buttonText;
  List<T> function;
  ShowPopupWithMultiAction(
      {required this.popupName,
      required this.buttonText,
      required this.function,
      this.description,
      this.iconUrl});
}

mixin PopUpMixins {
  StreamController<IPopUp> popUpController = StreamController<IPopUp>.broadcast();
  void setPopUpEvents({required IPopUp event}) {
    popUpController.add(event);
  }

  void closePopUpMixin() async {
    await popUpController.close();
  }
}
