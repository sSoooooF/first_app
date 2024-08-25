import 'package:first_app/features/auth/domain/bloc/registration/registration_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Регистрация')),
      body: BlocProvider(
        create: (context) => RegistrationBloc(),
        child: BlocBuilder<RegistrationBloc, RegistrationState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.only(
                  bottom: 32, top: 64, left: 16, right: 16),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) => context
                        .read<RegistrationBloc>()
                        .add(EmailChanged(value)),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      errorText: state.isSubmitted && !state.isEmailValid
                          ? state.emailError
                          : null,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    onChanged: (value) => context
                        .read<RegistrationBloc>()
                        .add(PasswordChanged(value)),
                    decoration: InputDecoration(
                      labelText: 'Пароль',
                      border: OutlineInputBorder(),
                      errorText: state.isSubmitted && !state.isPasswordValid
                          ? state.passwordError
                          : null,
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    onChanged: (value) => context
                        .read<RegistrationBloc>()
                        .add(ConfirmPasswordChanged(value)),
                    decoration: InputDecoration(
                      labelText: 'Повторите пароль',
                      border: OutlineInputBorder(),
                      errorText:
                          state.isSubmitted && !state.isConfirmPasswordValid
                              ? state.confirmPasswordError
                              : null,
                    ),
                    obscureText: true,
                  ),
                  const Spacer(),
                  FilledButton(
                    style: ButtonStyle(
                        fixedSize: WidgetStateProperty.all(
                            const Size(double.maxFinite, 40))),
                    child: const Text('Зарегистрироваться'),
                    onPressed: () {
                      context
                          .read<RegistrationBloc>()
                          .add(const RegisterSubmitted());
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
