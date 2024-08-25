import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'registration_event.dart';

part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(const RegistrationState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<ConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

  void _onEmailChanged(EmailChanged event, Emitter<RegistrationState> emit) {
    final isValidEmail = _validateEmail(event.email);
    emit(state.copyWith(
      email: event.email,
      isEmailValid: isValidEmail,
      emailError: isValidEmail ? '' : 'Неверный формат email',
      isFormValid: isValidEmail && state.isPasswordValid && state.isConfirmPasswordValid,
    ));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<RegistrationState> emit) {
    final isValidPassword = _validatePassword(event.password);
    final isConfirmPasswordValid = _validateConfirmPassword(event.password, state.confirmPassword);
    emit(state.copyWith(
      password: event.password,
      isPasswordValid: isValidPassword,
      isConfirmPasswordValid: isConfirmPasswordValid,
      passwordError: isValidPassword ? '' : 'Пароль должен содержать минимум 6 символов',
      confirmPasswordError: isConfirmPasswordValid ? '' : 'Пароли не совпадают',
      isFormValid: state.isEmailValid && isValidPassword && isConfirmPasswordValid,
    ));
  }

  void _onConfirmPasswordChanged(ConfirmPasswordChanged event, Emitter<RegistrationState> emit) {
    final isConfirmPasswordValid = _validateConfirmPassword(state.password, event.confirmPassword);
    emit(state.copyWith(
      confirmPassword: event.confirmPassword,
      isConfirmPasswordValid: isConfirmPasswordValid,
      confirmPasswordError: isConfirmPasswordValid ? '' : 'Пароли не совпадают',
      isFormValid: state.isEmailValid && state.isPasswordValid && isConfirmPasswordValid,
    ));
  }

  void _onRegisterSubmitted(RegisterSubmitted event, Emitter<RegistrationState> emit) {
    if (state.isFormValid) {
      emit(state.copyWith(isSubmitted: true));
    } else {
      emit(state.copyWith(isSubmitted: true));
    }
  }

  bool _validateEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  bool _validatePassword(String password) {
    return password.length >= 6;
  }

  bool _validateConfirmPassword(String password, String confirmPassword) {
    return password == confirmPassword;
  }
}
