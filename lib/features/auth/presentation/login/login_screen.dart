import 'package:first_app/features/auth/domain/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  bool _isValidEmail = false;
  bool _isValidPassword = false;

  void _validateEmail(String value) {
    RegExp emailRegEx =
    RegExp(r'([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9_-]+)');
    setState(() {
      _isValidEmail = emailRegEx.hasMatch(value);
    });
  }

  void _validatePassword(String value) {
    setState(() {
      _isValidPassword = value.length >= 8;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  VoidCallback? _getValidateStatus() =>
      (_isValidEmail && _isValidPassword)
          ? () {
        print('Email: ${_emailController.text}');
        print('Password: ${_passwordController.text}');
        _emailController.clear();
        _passwordController.clear();
      }
          : null;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Вход'),
        ),
        body: SafeArea(
          child: Padding(
            padding:
            const EdgeInsets.only(bottom: 32, top: 64, left: 16, right: 16),
            child: Center(
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          errorText: state.emailValidationState
                          is EmailValidationStateInvalid
                              ? "Invalid email format"
                              : null,
                          border: const OutlineInputBorder(),
                        ),
                        onChanged: (email) {
                          context
                              .read<LoginBloc>()
                              .add(EmailChanged(email: email));
                        },
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Пароль',
                          errorText: state.passwordValidationState
                          is PasswordValidationStateInvalid
                              ? "Password must be at least 8 characters long"
                              : null,
                          border: const OutlineInputBorder(),
                        ),
                        onChanged: (password) {
                          context
                              .read<LoginBloc>()
                              .add(PasswordChanged(password: password));
                        },
                        obscureText: true,
                      ),
                      const Spacer(),
                      FilledButton(
                        onPressed: () {
                          if (state is LoginSubmitted) {
                            return;
                          } else {
                            return;
                          }
                        },
                        style: ButtonStyle(
                          fixedSize: WidgetStateProperty.all(
                              const Size(double.maxFinite, 40)),
                        ),
                        child: const Text('Войти'),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}