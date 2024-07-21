import 'package:first_app/features/onboarding/domain/onboarding_entity.dart';
import 'package:first_app/features/onboarding/presentation/widgets/onboarding_widgets.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  static const _onboardingData = [
    OnboardingEntity(
      title: 'Welcome to the App 1',
      description: 'This is a simple onboarding screen 1',
      image: 'images/icon.svg',
    ),
    OnboardingEntity(
      title: 'Welcome to the App 2',
      description: 'This is a simple onboarding screen 2',
      image: 'images/icon.svg',
    ),
    OnboardingEntity(
      title: 'Welcome to the App 3',
      description: 'This is a simple onboarding screen 3',
      image: 'images/icon.svg',
    ),
  ];

  const OnboardingScreen({
    super.key,
  });

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late OnboardingEntity currentEntity;

  @override
  void initState() {
    super.initState();
    currentEntity = OnboardingScreen._onboardingData.first;
  }

  void _onNextPressed() {
    final currentIndex =
        OnboardingScreen._onboardingData.indexOf(currentEntity);

    if (currentIndex < OnboardingScreen._onboardingData.length - 1) {
      setState(() {
        currentEntity = OnboardingScreen._onboardingData[currentIndex + 1];
      });
    }
  }

  void _onSkipPressed() {
    setState(() {
      currentEntity = OnboardingScreen._onboardingData.last;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 64, left: 32, right: 32, bottom: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContentBloc(
                title: currentEntity.title,
                body: currentEntity.description,
                pageIndex: 1,
                svgImage: currentEntity.image,
                pageCount: 3,
              ),
              ControlButtons(
                onNextPressed: _onNextPressed,
                onSkipPressed: _onSkipPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
