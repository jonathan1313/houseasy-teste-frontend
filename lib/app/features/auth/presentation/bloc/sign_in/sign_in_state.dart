part of 'sign_in_bloc.dart';

enum SignInStatus {
  initial,
  loading,
  success,
  failure,
}

class SignInState extends Equatable {
  final String message;
  final SignInStatus status;
  final String email;
  final String password;

  const SignInState({
    this.message = '',
    this.status = SignInStatus.initial,
    this.email = '',
    this.password = '',
  });

  SignInState copyWith({
    String? message,
    SignInStatus? status,
    String? email,
    String? password,
  }) {
    return SignInState(
        message: message ?? this.message,
        status: status ?? this.status,
        email: email ?? this.email,
        password: password ?? this.password);
  }

  @override
  List<Object?> get props => [
        message,
        status,
        email,
        password,
      ];
}
