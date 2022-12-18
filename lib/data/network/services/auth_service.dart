import 'package:clean_arch_template/data/config/build_config.dart';
import 'package:clean_arch_template/data/network/entities/auth_response.dart';
import 'package:clean_arch_template/data/network/entities/login_request.dart';
import 'package:clean_arch_template/di/modules/network_module.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'auth_service.g.dart';

@lazySingleton
@RestApi()
abstract class AuthService {

  @factoryMethod
  factory AuthService(@Named(DioConfig.unauthorized) Dio dio) {
    return _AuthService(dio, baseUrl: BuildConfig.baseUrl);
  }

  @POST('/auth/login/')
  Future<AuthResponse> login(@Body() LoginRequest loginRequest);
}