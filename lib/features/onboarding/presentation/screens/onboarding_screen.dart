import 'package:first_app/features/onboarding/domain/onboarding_entity.dart';
import 'package:first_app/features/onboarding/presentation/widgets/onboarding_widgets.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  static const _onboarding = OnboardingEntity(
    pages: [
      OnboardingPageEntity(
        title: 'Welcome to the App 1',
        description: 'This is a simple onboarding screen 1',
        image: 'images/icon.svg',
      ),
      OnboardingPageEntity(
        title: 'Welcome to the App 2',
        description: 'This is a simple onboarding screen 2',
        image: 'images/icon.svg',
      ),
      OnboardingPageEntity(
        title: 'Welcome to the App 3',
        description: 'This is a simple onboarding screen 3',
        image: 'images/icon.svg',
      ),
    ],
  );

  const OnboardingScreen({
    super.key,
  });

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int index = 0;

  void _onNextPressed() {
    if (index > OnboardingScreen._onboarding.pagesCount - 1) return;
    setState(() {
      index++;
    });
  }

  void _onSkipPressed() {
    setState(() {
      index = OnboardingScreen._onboarding.pagesCount - 1;
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
                title: OnboardingScreen._onboarding.getPage(index).title,
                body: OnboardingScreen._onboarding.getPage(index).description,
                pageIndex: index,
                svgImage: OnboardingScreen._onboarding.getPage(index).image,
                pageCount: OnboardingScreen._onboarding.pagesCount,
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
