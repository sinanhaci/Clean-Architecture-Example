import 'package:dio/dio.dart';
import 'package:example/app_configs/env_config.dart';
import 'package:example/core/constants/app_constants.dart';
import 'package:example/core/constants/url_constants.dart';
import 'package:flutter_test/flutter_test.dart';


void main(){
  late Dio dio;
  
  setUp(() async {
    dio = Dio();
    await EnvConfig.init();
    dio.options.baseUrl = AppConstants.apiBaseUrl;
    dio.options.responseType = ResponseType.json;
  });

  group("User Data Source", () {
    test("If the status code is 200, it should return a List<User>.", () async {
      final response = await dio.get(UrlConstants.users);
      expect(response.statusCode, 200);
    });

    test("If the status code is 200, it should return the user data.", () async {
      const int userId = 1; 
      final response = await dio.get("${UrlConstants.users}/$userId");
      expect(response.statusCode, 200);
    });
   });
}