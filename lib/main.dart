import 'package:dio/dio.dart';
import 'package:first_app/api/rest_client.dart';
import 'package:first_app/features/onboarding/data/repository/onboarding_repoditory.dart';
import 'package:first_app/features/onboarding/presentation/screens/get_started_screen.dart';
import 'package:first_app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final client = RestClient(Dio());
final repository = OnboardingRepository(client: client);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Задачник',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff336940)),
        fontFamily: 'Roboto',

      ),
      home: GetStarted(
        // repository: repository,
      ),
    );
  }
}
