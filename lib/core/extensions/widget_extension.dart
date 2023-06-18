import 'package:flutter/material.dart';



extension PaddingExtension on Widget {
  Padding get paddingVertical => Padding(padding: const EdgeInsets.symmetric(vertical: 15),child: this);
  Padding get paddingHorizontal => Padding(padding: const EdgeInsets.symmetric(horizontal: 15),child: this);
  Padding get paddingTop => Padding(padding: const EdgeInsets.only(top: 15),child: this);
  Padding get paddingBottom => Padding(padding: const EdgeInsets.only(bottom: 15),child: this);
  Padding get paddingRight => Padding(padding: const EdgeInsets.only(right: 15),child: this);
  Padding get paddingLeft => Padding(padding: const EdgeInsets.only(left: 15),child: this);

}

extension CenterExtension on Widget {
  Center get center => Center(child: this);
}