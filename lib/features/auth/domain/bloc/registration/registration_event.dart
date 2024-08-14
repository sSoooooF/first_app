part of 'registration_bloc.dart';

@immutable
sealed class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends RegistrationEvent {
  final String email;

  const EmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends RegistrationEvent {
  final String password;

  const PasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class RepeatedPasswordChanged extends RegistrationEvent {
  final String repeatedPassword;

  const RepeatedPasswordChanged({required this.repeatedPassword});

  @override
  List<Object> get props => [repeatedPassword];
}

class FormSubmitted extends RegistrationEvent {
  const FormSubmitted();
  @override
  List<Object> get props => [];
}



