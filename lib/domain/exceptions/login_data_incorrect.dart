import 'package:clean_arch_template/domain/exceptions/base_exception.dart';
import 'package:flutter/material.dart';

@immutable
class LoginDataIncorrectException extends BaseException{
  const LoginDataIncorrectException(String message):super(message);
}