import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';


class NetworkException  implements Exception {
  late String err;

  NetworkException.fromDioException(DioException error) {
    String dioMessage = _getDioMessage(error);
    try {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
           err = 'Connection Timeout. $dioMessage';
           break;
        case DioExceptionType.sendTimeout:
           err = 'Send Request Timeout. $dioMessage';
           break;
        case DioExceptionType.receiveTimeout:
           err = 'Receive Timeout. $dioMessage';
           break;
        case DioExceptionType.badCertificate:
           err = 'Bad Certificate. $dioMessage';
           break;
        case DioExceptionType.badResponse:
           err = _handleStatusCode(error);
           break;
        case DioExceptionType.cancel:
           err = 'Canceled Operation. $dioMessage';
           break;
        case DioExceptionType.connectionError:
           err = 'Network Issues. $dioMessage';
           break;
        case DioExceptionType.unknown:
           err = 'Unknown Error. $dioMessage';
           break;
      } 
    } on SocketException catch (e) {
      err = 'No internet : ${e.message}';
    }
    on FormatException catch (e) {
      err = 'Format Exception : ${e.message}';
    } on Exception catch (e) {
      err = 'Error unrecognized : ${e.toString()}';
    }
  }

  String _handleStatusCode(DioException error) {
    String? dioMessage = _getDioMessage(error);
    switch (error.response?.statusCode) {
      case 400:
        return 'Bad Request. $dioMessage';
      case 401:
        return 'Unauthorized. $dioMessage';
      case 403:
        return 'Forbidden. $dioMessage';
      case 404:
        return 'Not Found. $dioMessage';
      case 500:
        return 'Internal server error. $dioMessage';
      default:
        return 'Something went wrong!';
    }
  }

  String _getDioMessage(DioException error){
    if(kDebugMode){
      return ' ---> ${error.message}';
    }
    return "";
  }

}
