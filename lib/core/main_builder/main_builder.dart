import 'package:flutter/material.dart';
import 'main_builder_controller.dart';

class MainBuild {
  MainBuild._();
  static Widget build(BuildContext context, Widget? child) {
    return Stack(
      children: [
        GestureDetector(
          onTap: MainController.instance.closeKeyboard,
          child: child ?? const SizedBox(),
        ),
      ],
    );
  }
}
