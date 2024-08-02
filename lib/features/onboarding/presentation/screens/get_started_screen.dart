import 'package:first_app/features/onboarding/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;
    final buttonStyle = Theme.of(context).buttonTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Добро пожаловать в UpTodo',
                      style: textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Войдите в приложение, чтобы не потерять доступ к своим задачам',
                      style: textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FilledButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                      },
                      style: ButtonStyle(
                        fixedSize: WidgetStateProperty.all(const Size(double.maxFinite, 40)),
                      ),
                      child: const Text('Войти'),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        fixedSize: WidgetStateProperty.all(const Size.fromWidth(double.maxFinite)),
                      ),
                      child: const Text('Зарегистироваться'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
