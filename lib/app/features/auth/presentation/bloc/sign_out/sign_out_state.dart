part of 'sign_out_bloc.dart';

enum SignOutStatus {
  initial,
  loading,
  success,
  failure,
}

class SignOutState extends Equatable {
  final String message;
  final SignOutStatus status;

  const SignOutState({
    this.message = '',
    this.status = SignOutStatus.initial,
  });

  SignOutState copyWith({
    String? message,
    SignOutStatus? status,
  }) {
    return SignOutState(
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        message,
        status,
      ];
}
