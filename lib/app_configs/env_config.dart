import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  EnvConfig._();

  static init() async {
    await dotenv.load(fileName: ".env");
  }
}