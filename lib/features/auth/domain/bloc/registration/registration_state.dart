part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  final EmailValidationState emailValidationState;
  final PasswordValidationState passwordValidationState;
  final RepeatedPasswordValidationState repeatedPasswordValidationState;

  const RegistrationState({
    required this.emailValidationState,
    required this.passwordValidationState,
    required this.repeatedPasswordValidationState,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        emailValidationState,
        passwordValidationState,
        repeatedPasswordValidationState
      ];

  RegistrationState copyWith({
    EmailValidationState? emailValidationState,
    PasswordValidationState? passwordValidationState,
    RepeatedPasswordValidationState? repeatedPasswordValidationState,
  }) {
    return RegistrationState(
      emailValidationState: emailValidationState ?? this.emailValidationState,
      passwordValidationState:
          passwordValidationState ?? this.passwordValidationState,
      repeatedPasswordValidationState: repeatedPasswordValidationState ??
          this.repeatedPasswordValidationState,
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

class PasswordValidationStateInvalid extends PasswordValidationState {
  const PasswordValidationStateInvalid({required super.errorMessage});

  @override
  List<Object?> get props => [];
}

class PasswordValidationStateValid extends PasswordValidationState {
  const PasswordValidationStateValid() : super(errorMessage: null);

  @override
  List<Object?> get props => [];
}

sealed class RepeatedPasswordValidationState extends Equatable {
  final String? errorMessage;

  const RepeatedPasswordValidationState({required this.errorMessage});
}

class RepeatedPasswordValidationStateInvalid extends RepeatedPasswordValidationState {
  const RepeatedPasswordValidationStateInvalid({required super.errorMessage});

  @override
  List<Object?> get props => [];
}

class RepeatedPasswordValidationStateValid extends RepeatedPasswordValidationState {
  const RepeatedPasswordValidationStateValid() : super(errorMessage: null);

  @override
  List<Object?> get props => [];
}
