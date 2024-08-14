part of 'onboarding_bloc.dart';

sealed class OnboardingEvent extends Equatable {
  const OnboardingEvent();
}

final class OnStartLoading extends OnboardingEvent {
  @override
  List<Object?> get props => [];
}

final class OnNextPagePressed extends OnboardingEvent {
  @override
  List<Object?> get props => [];
}

final class OnSkipPressed extends OnboardingEvent {
  @override
  List<Object?> get props => [];
}

final class OnStartPressed extends OnboardingEvent {
  @override
  List<Object?> get props => [];
}