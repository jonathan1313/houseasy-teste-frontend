part of 'sign_up_bloc.dart';

enum SignUpStatus {
  initial,
  loading,
  success,
  failure,
}

class SignUpState extends Equatable {
  final String message;
  final SignUpStatus status;
  final String email;
  final String password;
  final String passwordConfirmation;
  final String userName;

  const SignUpState({
    this.message = '',
    this.status = SignUpStatus.initial,
    this.email = '',
    this.password = '',
    this.passwordConfirmation = '',
    this.userName = '',
  });

  SignUpState copyWith({
    String? message,
    SignUpStatus? status,
    String? email,
    String? password,
    String? passwordConfirmation,
    String? userName,
  }) {
    return SignUpState(
      message: message ?? this.message,
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      passwordConfirmation: passwordConfirmation ?? this.password,
      userName: userName ?? this.userName,
    );
  }

  @override
  List<Object?> get props => [
        message,
        status,
        email,
        password,
        passwordConfirmation,
        userName,
      ];
}
