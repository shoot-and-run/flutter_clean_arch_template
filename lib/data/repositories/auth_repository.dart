import 'package:clean_arch_template/data/data_storage/app_preference.dart';
import 'package:clean_arch_template/data/network/entities/login_request.dart';
import 'package:clean_arch_template/data/network/mappers/dio_error_mapper.dart';
import 'package:clean_arch_template/data/network/services/auth_service.dart';
import 'package:clean_arch_template/domain/repositories/auth_repository.dart';
import 'package:clean_arch_template/utils/logger.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(
    this._authService,
    this._appPreferences,
    this._dioErrorMapper,
  );

  final AuthService _authService;
  final AppPreferences _appPreferences;

  final DioErrorMapper _dioErrorMapper;

  final logger = getLogger('AuthRepo');

  @override
  Future<void> logIn(String username, String password) async {
    try {
      final response = await _authService.login(
        LoginRequest(
          username: username,
          password: password,
        ),
      );

      await _appPreferences.putString(
        PreferenceConstants.authToken,
        response.token,
      );
    } on DioError catch (error) {
      throw _dioErrorMapper.map(error);
    }
  }
}
