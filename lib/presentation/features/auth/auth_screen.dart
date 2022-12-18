import 'package:clean_arch_template/presentation/base/cubit/cubit_state.dart';
import 'package:clean_arch_template/presentation/features/auth/auth_cubit.dart';
import 'package:clean_arch_template/presentation/widgets/form_field.dart';
import 'package:clean_arch_template/utils/logger.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  static const screenName = '/login';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends CubitState<AuthScreen, AuthState, AuthCubit> {
  final nicknameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final logger = getLogger('AuthScreen');

  @override
  void initParams(BuildContext context) {
    super.initParams(context);
    final state = cubit(context).state;

    nicknameTextController
      ..text = state.nickname
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: nicknameTextController.text.length))
      ..addListener(() {
        cubit(context).onNicknameChanged(nicknameTextController.text);
      });

    passwordTextController
      ..text = state.password
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: passwordTextController.text.length))
      ..addListener(() {
        cubit(context).onPasswordChanged(passwordTextController.text);
      });
  }

  @override
  void onStateChanged(BuildContext context, AuthState state) {
    if (state.isSuccess) {
      logger.i('success');
    }
  }

  @override
  Widget buildWidget(BuildContext context) {
    return observeState(
      builder: (context, state) => Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    FormFieldWidget(
                      labelText: 'Nickname',
                      controller: nicknameTextController,
                      errorText: state.dataIsIncorrect
                          ? 'Username or/and password is incorrect'
                          : state.invalidNickname
                              ? 'This field is required'
                              : null,
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                    ),
                    const SizedBox(height: 10),
                    FormFieldWidget(
                      labelText: 'Password',
                      isPasswordField: true,
                      controller: passwordTextController,
                      errorText: state.dataIsIncorrect
                          ? 'Username or/and password is incorrect'
                          : state.invalidPassword
                              ? 'This field is required'
                              : null,
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: cubit(context).onLogIn,
                  child: const Text('Log in'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
