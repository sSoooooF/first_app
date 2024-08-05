import 'package:first_app/features/auth/domain/bloc/registration/registration_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegistrationBloc>(
      create: (context) => RegistrationBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Регистрация'),
        ),
        body: SafeArea(
          child: Padding(
            padding:
            const EdgeInsets.only(bottom: 32, top: 64, left: 16, right: 16),
            child: Center(
              child: BlocBuilder<RegistrationBloc, RegistrationState>(
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          errorText: state.emailValidationState is EmailValidationStateInvalid ? "Invalid email format" : null,
                          border: const OutlineInputBorder(),
                        ),
                        onChanged: (email) {
                          context.read<RegistrationBloc>().add(EmailChanged(email: email));
                        },
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Пароль',
                          errorText: state.passwordValidationState is PasswordValidationStateInvalid ? "Password must be at least 8 characters long" : null,
                          border: const OutlineInputBorder(),
                        ),
                        onChanged: (password) {
                          context.read<RegistrationBloc>().add(PasswordChanged(password: password));
                        },
                        obscureText: true,
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Повторите пароль',
                          errorText: state.repeatedPasswordValidationState is RepeatedPasswordValidationStateInvalid ? "Passwords don't match" : null,
                          border: const OutlineInputBorder(),
                        ),
                        onChanged: (repeatedPassword) {
                          context.read<RegistrationBloc>().add(RepeatedPasswordChanged(repeatedPassword: repeatedPassword));
                        },
                        obscureText: true,
                      ),
                      const Spacer(),
                      FilledButton(
                        onPressed: null,
                        style: ButtonStyle(
                          fixedSize: WidgetStateProperty.all(
                              const Size(double.maxFinite, 40)),
                        ),
                        child: const Text('Создать аккаунт'),
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
