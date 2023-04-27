import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/usecases/sign_up/sign_up_usecase.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUsecase _signUpUsecase;

  SignUpBloc({required signUpUsecase})
      : _signUpUsecase = signUpUsecase,
        super(const SignUpState()) {
    on<SignUpEventUserNameTextChangedEvent>(_handleSignUpEventUserNameTextChangedEvent);
    on<SignUpEventEmailTextChangedEvent>(_handleSignUpEventEmailTextChangedEvent);
    on<SignUpEventPasswordTextChangedEvent>(_handleSignUpEventPasswordTextChangedEvent);
    on<SignUpEventPasswordConfirmationTextChangedEvent>(_handleSignUpEventPasswordConfirmationTextChangedEvent);
    on<SignUpEventSubmitButtonPressedEvent>(_handleSignUpEventSubmitButtonPressedEvent);
  }

  Future<void> _handleSignUpEventUserNameTextChangedEvent(
    SignUpEventUserNameTextChangedEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(userName: event.userName));
  }

  Future<void> _handleSignUpEventEmailTextChangedEvent(
    SignUpEventEmailTextChangedEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(userName: event.email));
  }

  Future<void> _handleSignUpEventPasswordTextChangedEvent(
    SignUpEventPasswordTextChangedEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(userName: event.password));
  }

  Future<void> _handleSignUpEventPasswordConfirmationTextChangedEvent(
    SignUpEventPasswordConfirmationTextChangedEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(userName: event.passwordConfirmation));
  }

  Future<void> _handleSignUpEventSubmitButtonPressedEvent(
    SignUpEventSubmitButtonPressedEvent event,
    Emitter<SignUpState> emit,
  ) async {

    try {

      emit(state.copyWith(status: SignUpStatus.loading));

      await _signUpUsecase.createUserWithEmailAndPassword(email: state.email, password: state.password, userName: state.userName);

      emit(state.copyWith(status: SignUpStatus.success, message: 'Seu cadastro foi realizado com sucesso!'));
      
    } on FirebaseAuthException catch (error, stack) {

      log('Erro ao execulta a função de registrar novo usuário com email e senha', error: error, stackTrace: stack);

      final String errorMessage;

      if (error.code == 'email-already-in-use') {
        errorMessage = 'O E-mail informado já está associado à outra conta.';
      } else if (error.code == 'weak-password') {
        errorMessage = 'A senha informada é muito fraca.';
      } else if (error.code == 'invalid-email') {
        errorMessage = 'O E-mail informado está em um formato inválido.';
      } else {
        errorMessage = 'Não foi possível concluir seu cadastro, por favor tente novamente.';
      }

      emit(state.copyWith(status: SignUpStatus.failure, message: errorMessage));
      
    } catch (error, stack) {
      log('Erro ao realizar cadastro de usuário com email e senha', error: error, stackTrace: stack);

      emit(state.copyWith(status: SignUpStatus.failure, message: 'Não foi possivel realizar seu cadastro no momento, por favor tente novamente.'));
    }

  }

}
