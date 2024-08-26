import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailChangedEvent>(_onEmailChanged);
    on<PasswordChangedEvent>(_onPasswordChanged);
    on<LoginSubmittedEvent>(_onLoginSubmitted);
  }

  void _onEmailChanged(EmailChangedEvent event, Emitter<LoginState> emit) {
    final isValidEmail = _validateEmail(event.email);
    emit(
      state.copyWith(
        email: event.email,
        isFormValid: isValidEmail && state.password.isNotEmpty,
        isSubmitted: false,
      ),
    );
  }

  void _onPasswordChanged(
      PasswordChangedEvent event, Emitter<LoginState> emit) {
    final isValidPassword = _validatePassword(event.password);
    emit(
      state.copyWith(
        password: event.password,
        isFormValid: state.email.isNotEmpty && isValidPassword,
        isSubmitted: false,
      ),
    );
  }

  void _onLoginSubmitted(LoginSubmittedEvent event, Emitter<LoginState> emit) {
    final isValidEmail = _validateEmail(state.email);
    final isValidPassword = _validatePassword(state.password);

    if (isValidEmail && isValidPassword) {
      emit(NavigationState());
      return;
    }

    String errorMessage = '';

    if (!isValidEmail) {
      errorMessage = 'Please enter a valid email address.';
    }

    if (!isValidPassword) {
      errorMessage = 'Password must be at least 6 characters long.';
    }

    emit(state.copyWith(
      isSubmitted: true,
      isFormValid: false,
      errorMessage: errorMessage.trim(),
    ));
  }

  bool _validateEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  bool _validatePassword(String password) {
    return password.length >= 6;
  }
}
