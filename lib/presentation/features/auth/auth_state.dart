part of 'auth_cubit.dart';

@immutable
class AuthState extends Equatable {
  const AuthState({
    this.nickname = '',
    this.password = '',
    this.invalidNickname = false,
    this.invalidPassword = false,
    this.isSuccess = false,
    this.dataIsIncorrect = false,
  });

  final String nickname;
  final String password;

  final bool invalidNickname;
  final bool invalidPassword;

  final bool isSuccess;

  final bool dataIsIncorrect;

  AuthState copyWith({
    String? nickname,
    String? password,
    bool? invalidNickname,
    bool? invalidPassword,
    bool? isSuccess,
    bool? dataIsIncorrect,
  }) {
    return AuthState(
      nickname: nickname ?? this.nickname,
      password: password ?? this.password,
      invalidNickname: invalidNickname ?? this.invalidNickname,
      invalidPassword: invalidPassword ?? this.invalidPassword,
      isSuccess: isSuccess ?? this.isSuccess,
      dataIsIncorrect: dataIsIncorrect ?? this.dataIsIncorrect,
    );
  }

  @override
  List<Object?> get props => [
        nickname,
        password,
        isSuccess,
        invalidNickname,
        invalidPassword,
        dataIsIncorrect,
      ];
}
