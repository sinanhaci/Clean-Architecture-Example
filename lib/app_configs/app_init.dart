import 'package:flutter/material.dart';
import '../injector.dart';
import '../main.dart';
import 'env_config.dart';

class AppInit{
  AppInit._();

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EnvConfig.init();
    await Injector.setup();
    runApp(ExampleApp());
  }
}