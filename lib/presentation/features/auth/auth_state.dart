part of 'auth_cubit.dart';

@immutable
class AuthState extends Equatable {
  const AuthState({
    this.username = '',
    this.password = '',
    this.invalidUsername = false,
    this.invalidPassword = false,
    this.isSuccess = false,
    this.dataIsIncorrect = false,
  });

  final String username;
  final String password;

  final bool invalidUsername;
  final bool invalidPassword;

  final bool isSuccess;

  final bool dataIsIncorrect;

  AuthState copyWith({
    String? username,
    String? password,
    bool? invalidUsername,
    bool? invalidPassword,
    bool? isSuccess,
    bool? dataIsIncorrect,
  }) {
    return AuthState(
      username: username ?? this.username,
      password: password ?? this.password,
      invalidUsername: invalidUsername ?? this.invalidUsername,
      invalidPassword: invalidPassword ?? this.invalidPassword,
      isSuccess: isSuccess ?? this.isSuccess,
      dataIsIncorrect: dataIsIncorrect ?? this.dataIsIncorrect,
    );
  }

  @override
  List<Object?> get props => [
        username,
        password,
        isSuccess,
        invalidUsername,
        invalidPassword,
        dataIsIncorrect,
      ];
}
