import 'package:clean_arch_template/data/network/interceptor/interceptor.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const _timeout = 60000;

class DioConfig {
  static const unauthorized = 'unauthorized';
  static const authorized = 'authorized';
}

@module
abstract class NetworkModule {
  @Named(DioConfig.unauthorized)
  @lazySingleton
  Dio provideUnauthorizedDio(
    PrettyDioLogger dioLogger,
    BaseOptions dioOptions,
  ) {
    final dio = Dio(dioOptions)
      ..httpClientAdapter = DefaultHttpClientAdapter()
      ..interceptors.addAll([dioLogger]);

    return dio;
  }

  @Named(DioConfig.authorized)
  @lazySingleton
  Dio provideAuthorizedDio(
    AuthHeaderInterceptor interceptor,
    PrettyDioLogger dioLogger,
    BaseOptions dioOptions,
  ) {
    final dio = Dio(dioOptions)
      ..httpClientAdapter = DefaultHttpClientAdapter()
      ..interceptors.addAll([interceptor, dioLogger]);

    return dio;
  }

  PrettyDioLogger provideDioLogger() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
      compact: false,
      maxWidth: 200,
    );
  }

  BaseOptions get dioOptions {
    return BaseOptions(
      connectTimeout: _timeout,
      receiveTimeout: _timeout,
      sendTimeout: _timeout,
    );
  }
}
