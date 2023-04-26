part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInEmailTextChangedEvent extends SignInEvent {
  final String email;

  const SignInEmailTextChangedEvent({required this.email});

  @override
  List<Object> get props => [email];
}

class SignInPasswordTextChangedEvent extends SignInEvent {
  final String password;

  const SignInPasswordTextChangedEvent({required this.password});

  @override
  List<Object> get props => [password];
}

class SignInSubmmitButtonPressedEvent extends SignInEvent {
  const SignInSubmmitButtonPressedEvent();
}