import 'package:dio/dio.dart';
import 'package:example/core/constants/app_constants.dart';
import 'network_exception.dart';


class NetworkManager {
  late Dio _dio;

  NetworkManager(){
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.apiBaseUrl,
        responseType: ResponseType.json,
      ),
    );
    _dio.interceptors.add(LogInterceptor(responseBody: true,requestBody: true));
  }

  Future<Response> get(String path,{Map<String, dynamic>? queryParameters,}) async {
    try {
      final Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  Future<Response> post(String path,{data,Map<String, dynamic>? queryParameters}) async{
    try {
      final Response response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  Future<Response> put(String path,{data,Map<String, dynamic>? queryParameters}) async {
    try {
      final Response response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  Future<Response> delete(String path,{data,Map<String, dynamic>? queryParameters}) async {
    try {
      final Response response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }
}
