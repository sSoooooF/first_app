import 'package:first_app/features/core/data/settings_storage/settings_storage.dart';
import 'package:first_app/features/core/domain/entity/result.dart';
import 'package:first_app/features/onboarding/data/repository/onboarding_repository.dart';
import 'package:first_app/features/onboarding/domain/bloc/onboarding_bloc.dart';
import 'package:first_app/features/onboarding/presentation/screens/error_screen.dart';
import 'package:first_app/features/get_started/presentation/get_started_screen.dart';
import 'package:first_app/features/onboarding/presentation/widgets/onboarding_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatefulWidget {
  final IOnboardingRepository? repository;
  final ISettingsRepository? settingsRepository;

  const OnboardingScreen({
    super.key,
    required this.repository,
    required this.settingsRepository,
  });

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    _checkOnboardingStatus();
  }

  Future<void> _checkOnboardingStatus() async {
    final result = await widget.settingsRepository!.isOnboardingCompleted();
    if (result is ResultOk<bool, Failure> && result.data) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const GetStarted()));
      return;
    }
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Welcome to First App!')));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingBloc>(
      create: (context) =>
          OnboardingBloc(widget.repository!)..add(OnStartLoading()),
      child: BlocListener<OnboardingBloc, OnboardingState>(
        listenWhen: (c, p) {
          if (c != p && c is OnboardingNavigationToStarted) {
            return true;
          }
          return false;
        },
        listener: (context, state) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const GetStarted()));
        },
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 64, left: 32, right: 32, bottom: 32),
              child: BlocBuilder<OnboardingBloc, OnboardingState>(
                builder: (context, state) {
                  switch (state) {
                    case OnboardingLoading():
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case OnboardingContent():
                      final currentPage =
                          state.onboardingEntity.getPage(state.pageNumber);
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ContentBloc(
                            pageIndex: state.pageNumber,
                            title: currentPage.title,
                            body: currentPage.description,
                            svgImage: currentPage.image,
                            pageCount: state.onboardingEntity.pagesCount,
                          ),
                          ControlButtons(
                            isLastPage: state.pageNumber >=
                                state.onboardingEntity.pagesCount - 1,
                            onNextPressed: () {
                              context
                                  .read<OnboardingBloc>()
                                  .add(OnNextPagePressed());
                            },
                            onSkipPressed: () {
                              context
                                  .read<OnboardingBloc>()
                                  .add(OnSkipPressed());
                            },
                            onStartPressed: () async {
                              widget.settingsRepository!
                                  .setOnboardingCompleted();
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const GetStarted()));
                            },
                          ),
                        ],
                      );
                    case OnboardingError():
                      return ErrorScreen(onboardingError: state.error)
                          as Widget;
                    case _:
                      return const Center(
                        child: FlutterLogo(),
                      );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
