import 'package:first_app/features/core/domain/entity/result.dart';
import 'package:first_app/features/onboarding/data/repository/onboarding_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_app/features/onboarding/domain/onboarding_entity.dart';

part 'onboarding_event.dart';

part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final IOnboardingRepository repository;

  OnboardingBloc(this.repository) : super(OnboardingInitial()) {
    on<OnStartLoading>(_onStartLoading);
    on<OnNextPagePressed>(_onNextPressed);
    on<OnSkipPressed>(_onSkipPressed);
    on<OnStartPressed>(_onStartPressed);
  }

  Future<void> _onStartLoading(
      OnStartLoading event, Emitter<OnboardingState> emit) async {
    emit(OnboardingLoading());
    final result = await repository.getOnboarding();
    switch (result) {
      case ResultOk(:final data):
        emit(OnboardingContent(onboardingEntity: data, pageNumber: 0));
      case ResultFailed(:final failure):
        emit(OnboardingError(error: failure));
    }
  }

  void _onNextPressed(OnNextPagePressed event, Emitter<OnboardingState> emit) {
    switch (state) {
      case OnboardingContent(
          onboardingEntity: final currentOnboaringEntity,
          pageNumber: final currentPageNumber,
        ):
        if (currentPageNumber >= currentOnboaringEntity.pagesCount - 1) {
          return;
        }
        emit(OnboardingContent(
          onboardingEntity: currentOnboaringEntity,
          pageNumber: currentPageNumber + 1,
        ));
      case _:
        return;
    }
  }

  void _onSkipPressed(OnSkipPressed event, Emitter<OnboardingState> emit) {
    switch (state) {
      case OnboardingContent(onboardingEntity: final currentOnboaringEntity):
        emit(OnboardingContent(
          onboardingEntity: currentOnboaringEntity,
          pageNumber: currentOnboaringEntity.pagesCount - 1,
        ));
      case _:
        return;
    }
  }

  void _onStartPressed(OnStartPressed event, Emitter<OnboardingState> emit) {
    emit(OnboardingNavigationToStarted());
  }
}
