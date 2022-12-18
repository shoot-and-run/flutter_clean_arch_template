import 'package:clean_arch_template/data/network/entities/network_error.dart';
import 'package:clean_arch_template/data/network/mappers/network_error_mapper.dart';
import 'package:clean_arch_template/domain/exceptions/base_exception.dart';
import 'package:clean_arch_template/utils/logger.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DioErrorMapper {
  DioErrorMapper(this._networkErrorMapper);

  final NetworkErrorMapper _networkErrorMapper;

  final logger = getLogger('DioErrorMapper');

  Exception map(DioError error) {
    if (error.type == DioErrorType.response &&
        error.response?.statusCode == 500) {
      return BaseException(error.message);
    } else if (error.type == DioErrorType.response) {
      logger.i(error.response!.data);
      final networkError = NetworkError.fromJson(error.response!.data);

      return _networkErrorMapper.map(networkError);
    } else {
      return error;
    }
  }
}
