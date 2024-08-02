import 'package:first_app/features/onboarding/presentation/widgets/login_widgets.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const OutlinedTextFormField(
                  label: 'E-mail',
                  regularExpression:
                  "[a-zA-Z0-9+._%-+]{1,256}@[a-zA-Z0-9][a-zA-Z0-9-]{0,64}(.[a-zA-Z0-9][a-zA-Z0-9-]{0,25})+",
                ),
                const SizedBox(height: 32),
                const OutlinedTextFormField(label: 'Пароль', regularExpression: r'^(?=.*[a-z])(?=.*[A-])'),
                const Spacer(),
                FilledButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    fixedSize: WidgetStateProperty.all(
                        const Size(double.maxFinite, 40)),
                  ),
                  child: const Text('Войти'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
