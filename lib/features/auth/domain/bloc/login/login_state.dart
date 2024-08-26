part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final bool isSubmitted;
  final bool isFormValid;
  final String errorMessage;

  const LoginState({
    this.email = '',
    this.password = '',
    this.isSubmitted = true,
    this.isFormValid = false,
    this.errorMessage = '',
  });

  LoginState copyWith({
    String? email,
    String? password,
    bool? isSubmitted,
    bool? isFormValid,
    String? errorMessage,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isSubmitted: isSubmitted ?? this.isSubmitted,
      isFormValid: isFormValid ?? this.isFormValid,
      errorMessage: errorMessage?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [email, password, isSubmitted, isFormValid, errorMessage];
}

class NavigationState extends LoginState {}
