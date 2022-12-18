import 'package:clean_arch_template/data/data_storage/app_preference.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthHeaderInterceptor extends Interceptor {
  AuthHeaderInterceptor(this._appPreferences);

  final AppPreferences _appPreferences;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final authToken = _appPreferences.getString(PreferenceConstants.authToken);

    if (authToken != null) {
      options.headers
          .addAll(<String, String>{'authorization': 'Token $authToken'});
    }

    return handler.next(options);
  }
}
