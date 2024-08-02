import 'package:first_app/features/onboarding/domain/bloc/onboarding_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorScreen extends StatelessWidget {
  final Exception onboardingError;

  const ErrorScreen({super.key, required this.onboardingError});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Возникла ошибка.',
              style: textTheme.headlineMedium,
          ),
          Text(
            'Текст ошибки: ${onboardingError.toString()}',
              style: textTheme.bodyLarge,
          ),
          const SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {
              context.read<OnboardingBloc>().add(OnStartLoading());
            },
            child:  Text(
              'Перезапуск',
              style: textTheme.bodyLarge,
            ),
          )
        ],
      ),
    );
  }
}
