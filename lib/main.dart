import 'package:dio/dio.dart';
import 'package:first_app/features/core/data/api/rest_client.dart';
import 'package:first_app/features/core/data/settings_storage/settings_storage.dart';
import 'package:first_app/features/onboarding/data/repository/onboarding_repository.dart';
import 'package:first_app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final ISettingsRepository settingsRepository = SettingsRepository(prefs);
  final client = RestClient(Dio());
  final repository = OnboardingRepository(
    client: client,
    settingsRepository: settingsRepository,
  );
  runApp(MyApp(onboardingRepository: repository));
}

class MyApp extends StatelessWidget {
  final OnboardingRepository? onboardingRepository;

  const MyApp({super.key, required this.onboardingRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Задачник',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff336940)),
        fontFamily: 'Roboto',
      ),
      home: OnboardingScreen(
        repository: onboardingRepository,
      ),
    );
  }
}
