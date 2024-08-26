import 'package:first_app/features/auth/domain/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вход'),
      ),
      body: SafeArea(
        child: Padding(
          padding:
          const EdgeInsets.only(bottom: 32, top: 64, left: 16, right: 16),
          child: BlocProvider(
            create: (context) => LoginBloc(),
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        onChanged: (value) =>
                            context.read<LoginBloc>().add(
                                EmailChangedEvent(email: value)),
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        onChanged: (value) =>
                            context.read<LoginBloc>().add(
                                PasswordChangedEvent(password: value)),
                        decoration: const InputDecoration(
                          labelText: 'Пароль',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                      ),
                      const Spacer(),
                      FilledButton(
                        style: ButtonStyle(
                          fixedSize: WidgetStateProperty.all(
                              const Size(double.maxFinite, 40)),
                        ),
                        onPressed: state.isFormValid ? () {
                          context.read<LoginBloc>().add(
                              const LoginSubmittedEvent());
                        } : null,
                        child: const Text('Войти'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}