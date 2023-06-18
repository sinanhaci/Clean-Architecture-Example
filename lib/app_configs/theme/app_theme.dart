import 'package:flutter/material.dart';

class AppTheme {
  static AppTheme? _instance;

  static AppTheme get instance {
    _instance ??= AppTheme._init();
    return _instance!;
  }

  final Color primary = Colors.deepPurple;
  final Color onPrimary = Colors.purple;
  final Color secondary = Colors.black;
  final Color onSecondary = Colors.black54;
  final Color error = Colors.red;

  AppTheme._init();

  ThemeData get theme => ThemeData(
        colorScheme: ColorScheme.light(
          primary: primary,
          onPrimary: onPrimary,
          secondary: secondary,
          onSecondary: onSecondary,
          error: error,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          elevation: 1,
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.only(top: 5),
          focusedBorder: border(primary),
          border: border(primary),
          enabledBorder: border(secondary),
          errorBorder: border(error),
        ),
      );

  InputBorder border(Color color) {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}
