import 'package:dio/dio.dart';
import 'package:movie_app/core/helpers/env_variables.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      setupHeaders();
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void setupHeaders() {
    dio!.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${EnvVariables().token}'
    };
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(PrettyDioLogger(
        requestBody: true, requestHeader: true, responseBody: true));
  }
}
