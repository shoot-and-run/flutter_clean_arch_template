import 'package:clean_arch_template/data/network/entities/network_error.dart';
import 'package:clean_arch_template/domain/exceptions/base_exception.dart';
import 'package:clean_arch_template/domain/exceptions/login_data_incorrect.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NetworkErrorMapper{
  BaseException map(NetworkError error){
    switch (error.code){
      case 4003:
        return LoginDataIncorrectException(error.message);
      default:
        return BaseException(error.message);
    }
  }
}