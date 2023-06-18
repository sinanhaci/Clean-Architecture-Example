import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainController {
  static MainController? _instance;
  static MainController get instance {
    _instance ??= MainController._init();
    return _instance!;
  }

  MainController._init();
  
  closeKeyboard() async {
    if (FocusManager.instance.primaryFocus == null) {
      await SystemChannels.textInput.invokeMethod('TextInput.hide');
    } else {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

}