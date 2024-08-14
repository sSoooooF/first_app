part of 'login_bloc.dart';

class LoginState extends Equatable {
  final EmailValidationState emailValidationState;
  final PasswordValidationState passwordValidationState;

  const LoginState({
    required this.emailValidationState,
    required this.passwordValidationState,
  });

  @override
  List<Object?> get props => [
        emailValidationState,
        passwordValidationState,
      ];

  LoginState copyWith({
    EmailValidationState? emailValidationState,
    PasswordValidationState? passwordValidationState,
  }) {
    return LoginState(
      emailValidationState: emailValidationState ?? this.emailValidationState,
      passwordValidationState:
          passwordValidationState ?? this.passwordValidationState,
    );
  }
}

sealed class EmailValidationState extends Equatable {
  final String? errorMessage;

  const EmailValidationState({required this.errorMessage});
}

class EmailValidationStateValid extends EmailValidationState {
  const EmailValidationStateValid() : super(errorMessage: null);

  @override
  List<Object?> get props => [];
}

class EmailValidationStateInvalid extends EmailValidationState {
  const EmailValidationStateInvalid({required super.errorMessage});

  @override
  List<Object?> get props => [];
}

sealed class PasswordValidationState extends Equatable {
  final String? errorMessage;

  const PasswordValidationState({required this.errorMessage});
}

class PasswordValidationStateValid extends PasswordValidationState {
  const PasswordValidationStateValid() : super(errorMessage: null);

  @override
  List<Object?> get props => [];
}

class PasswordValidationStateInvalid extends PasswordValidationState {
  const PasswordValidationStateInvalid({required super.errorMessage});

  @override
  List<Object?> get props => [];
}

class LoginSubmitted extends LoginState {
  const LoginSubmitted({required super.emailValidationState, required super.passwordValidationState});

}
