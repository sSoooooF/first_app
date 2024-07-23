import 'package:first_app/features/onboarding/data/repository/onboarding_repoditory.dart';
import 'package:first_app/features/onboarding/domain/onboarding_entity.dart';
import 'package:first_app/features/onboarding/presentation/widgets/onboarding_widgets.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  final IOnboardingRepository repository;

  const OnboardingScreen({
    super.key,
    required this.repository,
  });

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  OnboardingEntity? onboardingEntity;
  int index = 0;

  bool get isLastPage => index >= onboardingEntity!.pagesCount - 1;

  void _onNextPressed() {
    if (onboardingEntity == null) return;
    if (index >= onboardingEntity!.pagesCount - 1) return;
    setState(() {
      index++;
    });
  }

  void _onSkipPressed() {
    if (onboardingEntity == null) return;
    setState(() {
      index = onboardingEntity!.pagesCount - 1;
    });
  }

  @override
  void initState() {
    super.initState();
    widget.repository.getOnboarding().then((onboarding) => {
          setState(() {
            onboardingEntity = onboarding;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 64, left: 32, right: 32, bottom: 32),
          child: onboardingEntity == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ContentBloc(
                      pageIndex: index,
                      title: onboardingEntity!.getPage(index).title,
                      body: onboardingEntity!.getPage(index).description,
                      svgImage: onboardingEntity!.getPage(index).image,
                      pageCount: onboardingEntity!.pagesCount,
                    ),
                    ControlButtons(
                      isLastPage: isLastPage,
                      onNextPressed: _onNextPressed,
                      onSkipPressed: _onSkipPressed,
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
