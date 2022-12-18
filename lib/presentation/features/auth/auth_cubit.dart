import 'package:bloc/bloc.dart';
import 'package:clean_arch_template/domain/exceptions/login_data_incorrect.dart';
import 'package:clean_arch_template/domain/repositories/auth_repository.dart';
import 'package:clean_arch_template/utils/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepository) : super(const AuthState());

  final AuthRepository _authRepository;

  final logger = getLogger('AuthCubit');

  Future<void> onLogIn() async {
    if (state.nickname.isNotEmpty && state.password.isNotEmpty) {
      try {
        await _authRepository.logIn(state.nickname, state.password);

        emit(state.copyWith(isSuccess: true));
      } on LoginDataIncorrectException {
        emit(state.copyWith(dataIsIncorrect: true));
      } on Exception catch (error) {
        logger.e(error);
      }
    } else {
      emit(state.copyWith(
        invalidNickname: state.nickname.isEmpty,
        invalidPassword: state.password.isEmpty,
      ));
    }
  }

  void onNicknameChanged(String nickname) {
    emit(state.copyWith(
      nickname: nickname,
      invalidNickname: false,
      dataIsIncorrect: false,
    ));
  }

  void onPasswordChanged(String password) {
    emit(state.copyWith(
      password: password,
      invalidPassword: false,
      dataIsIncorrect: false,
    ));
  }
}
