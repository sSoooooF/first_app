import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
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
                  mainAxisSize: MainAxisSize.m,
                  children: [
                    FilledButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        maximumSize:
                            WidgetStateProperty.all(Size.fromWidth(48)),
                        minimumSize:
                            WidgetStateProperty.all(Size.fromHeight(48)),
                      ),
                      child: const Text('Войти'),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        maximumSize:
                            WidgetStateProperty.all(Size.fromHeight(40)),
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
