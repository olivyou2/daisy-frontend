import 'package:flutter/cupertino.dart';

class RemoteActivator extends ChangeNotifier {
  String activateType = "";

  activate(String type) {
    activateType = type;
    notifyListeners();
  }

  listen(
    String type,
    Function func,
  ) {
    addListener(() {
      if (activateType == type) {
        func();
      }
    });
  }
}
