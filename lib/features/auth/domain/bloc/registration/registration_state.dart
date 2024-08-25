part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  final String email;
  final String password;
  final String confirmPassword;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isConfirmPasswordValid;
  final String emailError;
  final String passwordError;
  final String confirmPasswordError;
  final bool isFormValid;
  final bool isSubmitted;

  const RegistrationState({
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.isEmailValid = true,
    this.isPasswordValid = true,
    this.isConfirmPasswordValid = true,
    this.emailError = '',
    this.passwordError = '',
    this.confirmPasswordError = '',
    this.isFormValid = true,
    this.isSubmitted = false,
  });

  RegistrationState copyWith({
    String? email,
    String? password,
    String? confirmPassword,
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isConfirmPasswordValid,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
    bool? isFormValid,
    bool? isSubmitted,
  }) {
    return RegistrationState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isConfirmPasswordValid: isConfirmPasswordValid ?? this.isConfirmPasswordValid,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      confirmPasswordError: confirmPasswordError ?? this.confirmPasswordError,
      isFormValid: isFormValid ?? this.isFormValid,
      isSubmitted: isSubmitted ?? this.isSubmitted,
    );
  }

  @override
  List<Object?> get props => [
    email,
    password,
    confirmPassword,
    isEmailValid,
    isPasswordValid,
    isConfirmPasswordValid,
    emailError,
    passwordError,
    confirmPasswordError,
    isFormValid,
    isSubmitted,
  ];
}
