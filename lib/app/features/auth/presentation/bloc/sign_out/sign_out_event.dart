part of 'sign_out_bloc.dart';

abstract class SignOutEvent extends Equatable {
  const SignOutEvent();

  @override
  List<Object> get props => [];
}

class SignOutOnButtonPressedEvent extends SignOutEvent {
  const SignOutOnButtonPressedEvent();
}