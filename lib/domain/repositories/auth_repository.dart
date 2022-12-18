import 'package:clean_arch_template/domain/entities/login_params.dart';

abstract class AuthRepository{
  Future<void> logIn(LoginParams loginParams);
}