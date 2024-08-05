import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc()
      : super(const LoginState(
          emailValidationState: EmailValidationStateValid(),
          passwordValidationState: PasswordValidationStateValid(),
        )) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
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

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
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

  bool _isValidEmail(String email) {
    return RegExp(r'([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9_-]+)')
        .hasMatch(email);
  }

  bool _isValidPassword(String password) {
    return password.length >= 8;
  }
}
