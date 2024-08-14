import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'registration_event.dart';

part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc()
      : super(const RegistrationState(
    repeatedPasswordValidationState:
    RepeatedPasswordValidationStateValid(),
    emailValidationState: EmailValidationStateValid(),
    passwordValidationState: PasswordValidationStateValid(),
  )) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<RepeatedPasswordChanged>(_onRepeatedPasswordChanged);
    on<FormSubmitted>(_onFormSubmitted);
  }

  void _onEmailChanged(EmailChanged event, Emitter<RegistrationState> emit) {
    final email = event.email;
    if (_isValidEmail(email)) {
      emit(state.copyWith(
          emailValidationState: const EmailValidationStateValid()));
    } else {
      emit(state.copyWith(
          emailValidationState: const EmailValidationStateInvalid(
              errorMessage: 'Invalid email format')));
    }
  }

  void _onPasswordChanged(PasswordChanged event,
      Emitter<RegistrationState> emit) {
    final password = event.password;
    if (_isValidPassword(password)) {
      emit(state.copyWith(
          passwordValidationState: const PasswordValidationStateValid()));
    } else {
      emit(state.copyWith(
          passwordValidationState: const PasswordValidationStateInvalid(
              errorMessage:
              'Password must contain at least 8 characters')));
    }
  }

  void _onRepeatedPasswordChanged(RepeatedPasswordChanged event,
      Emitter<RegistrationState> emit) {
    final repeatedPassword = event.repeatedPassword;
    if (_isPasswordMatching("12345678", repeatedPassword)) {
      emit(state.copyWith(
          repeatedPasswordValidationState: const RepeatedPasswordValidationStateValid()));
    }
    else {
      emit(state.copyWith(
          repeatedPasswordValidationState: const RepeatedPasswordValidationStateInvalid(
              errorMessage: 'Passwords do not match')));
    }
  }

  void _onFormSubmitted(FormSubmitted event, Emitter<RegistrationState> emit) {
    if (state.emailValidationState is EmailValidationStateValid && state
        .passwordValidationState is PasswordValidationStateValid && state.repeatedPasswordValidationState is RepeatedPasswordValidationStateValid) {

    }
  }

  bool _isValidEmail(String email) {
    return RegExp(r'([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9_-]+)')
        .hasMatch(email);
  }

  bool _isValidPassword(String password) {
    return password.length >= 8;
  }

  bool _isPasswordMatching(String password, String repeatedPassword) {
    return password == repeatedPassword;
  }


}
