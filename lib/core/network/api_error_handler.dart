import 'dart:io';

import 'package:dio/dio.dart';
import 'package:movie_app/core/network/error_model.dart';

class ApiErrorHandler {
  static ErrorModel hanlde(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ErrorModel(
              message:
                  'Sorry, it looks like you are not connected to the internet. Please check your connection and try again.');
        case DioExceptionType.sendTimeout:
          return ErrorModel(
              message:
                  'The request timed out while sending data. Please try again.');
        case DioExceptionType.receiveTimeout:
          return ErrorModel(
              message:
                  'The request timed out while receiving data. Please try again.');
        case DioExceptionType.badCertificate:
          return ErrorModel(
              message:
                  'There seems to be an issue with the server\'s certificate. Please try again later.');
        case DioExceptionType.badResponse:
          return _handleError(error.response);
        case DioExceptionType.cancel:
          return ErrorModel(
              message: 'The request was canceled. Please try again.');
        case DioExceptionType.connectionError:
          return ErrorModel(
              message:
                  'Unable to connect to the server. Please check your internet connection and try again.');
        case DioExceptionType.unknown:
          if (error.error.toString().contains("SocketException")) {
            return ErrorModel(message: "No Internet connection.");
          } else {
            return ErrorModel(
                message:
                    'An unexpected error occurred. Please try again later.');
          }
      }
    } else if (error is SocketException) {
      return ErrorModel(message: "No Internet connection.");
    } else {
      return ErrorModel(
          message: 'An unexpected error occurred. Please try again later.');
    }
  }
}

ErrorModel _handleError(Response? response) {
  var result = response?.data;
  return ErrorModel.fromJson(result);
}
