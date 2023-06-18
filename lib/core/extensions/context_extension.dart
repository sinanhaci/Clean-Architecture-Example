import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get lowValue => height * 0.01;
  double get mediumValue => height * 0.03;
  double get highValue => height * 0.6;

  double get lowRadis => 8;
  double get mediumRadis => 14;
  double get highRadis => 20;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);
}

extension RadiusExtensionAll on BuildContext {
  BorderRadius get radiusLow => BorderRadius.all(Radius.circular(lowRadis));
  BorderRadius get radiusLowTop => BorderRadius.only(topLeft: Radius.circular(lowRadis),topRight: Radius.circular(lowRadis));
  BorderRadius get radiusLowBottom => BorderRadius.only(bottomLeft: Radius.circular(lowRadis),bottomRight: Radius.circular(lowRadis));
  BorderRadius get radiusMedium => BorderRadius.all(Radius.circular(mediumRadis));
  BorderRadius get radiusMediumTop => BorderRadius.only(topLeft: Radius.circular(mediumRadis),topRight: Radius.circular(mediumRadis));
  BorderRadius get radiusMediumBottom => BorderRadius.only(bottomLeft: Radius.circular(mediumRadis),bottomRight: Radius.circular(mediumRadis));
  BorderRadius get radiusHight => BorderRadius.all(Radius.circular(highRadis));
  BorderRadius get radiusHightTop => BorderRadius.only(topLeft: Radius.circular(highRadis),topRight: Radius.circular(highRadis));
  BorderRadius get radiusHightBottom => BorderRadius.only(bottomLeft: Radius.circular(highRadis),bottomRight: Radius.circular(highRadis));
}


extension PaddingExtensionSymetric on BuildContext {
  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get paddingNormalVertical => EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get paddingHighVertical => EdgeInsets.symmetric(vertical: highValue);
  EdgeInsets get paddingLowHorizontal => EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get paddingMediumHorizontal => EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get paddingHighHorizontal =>  EdgeInsets.symmetric(horizontal: highValue);
}

extension DurationExtension on BuildContext {
  Duration get lowDuration => const Duration(milliseconds: 250);
  Duration get mediumDuration => const Duration(milliseconds: 500);
  Duration get highDuration => const Duration(seconds: 1);
}
