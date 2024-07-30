part of 'onboarding_bloc.dart';

sealed class OnboardingState extends Equatable {
  const OnboardingState();
}

final class OnboardingInitial extends OnboardingState {
  @override
  List<Object> get props => [];
}

final class OnboardingLoading extends OnboardingState {
  @override
  List<Object?> get props => [];
}

final class OnboardingContent extends OnboardingState {
  final OnboardingEntity onboardingEntity;
  final int pageNumber;

  const OnboardingContent({
    required this.onboardingEntity,
    required this.pageNumber,
  });

  @override
  List<Object?> get props => [onboardingEntity, pageNumber];
}

final class OnboardingNavigationToStarted extends OnboardingState {
  @override
  List<Object?> get props => [];
}

final class OnboardingError extends OnboardingState {
  final Exception error;

  const OnboardingError({required this.error});

  @override
  List<Object?> get props => [error];
}