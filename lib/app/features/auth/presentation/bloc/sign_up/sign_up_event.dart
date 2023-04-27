part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpEventUserNameTextChangedEvent extends SignUpEvent {

  final String userName;

  const SignUpEventUserNameTextChangedEvent({required this.userName});

  @override
  List<Object> get props => [userName];
}

class SignUpEventEmailTextChangedEvent extends SignUpEvent {

  final String email;

  const SignUpEventEmailTextChangedEvent({required this.email});

  @override
  List<Object> get props => [email];
}

class SignUpEventPasswordTextChangedEvent extends SignUpEvent {

  final String password;

  const SignUpEventPasswordTextChangedEvent({required this.password});

  @override
  List<Object> get props => [password];
}

class SignUpEventPasswordConfirmationTextChangedEvent extends SignUpEvent {

  final String passwordConfirmation;

  const SignUpEventPasswordConfirmationTextChangedEvent({required this.passwordConfirmation});

  @override
  List<Object> get props => [passwordConfirmation];
}

class SignUpEventSubmitButtonPressedEvent extends SignUpEvent {
  const SignUpEventSubmitButtonPressedEvent();
}