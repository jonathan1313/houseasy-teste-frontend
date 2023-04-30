import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/usecases/sign_in/sign_in_usecase.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUsecase _signInUsecase;

  SignInBloc({required signInUsecase})
      : _signInUsecase = signInUsecase,
        super(const SignInState()) {
    on<SignInEmailTextChangedEvent>(_handleSignInEmailTextChangedEvent);
    on<SignInPasswordTextChangedEvent>(_handleSignInPasswordTextChangedEvent);
    on<SignInSubmmitButtonPressedEvent>(_handleSignInSubmmitButtonPressedEvent);
    on<SignInSetInitialStateEvent>(_handleSignInSetInitialStateEvent);
  }

  Future<void> _handleSignInEmailTextChangedEvent(
    SignInEmailTextChangedEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(email: event.email));
  }

  Future<void> _handleSignInPasswordTextChangedEvent(
    SignInPasswordTextChangedEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _handleSignInSubmmitButtonPressedEvent(
    SignInSubmmitButtonPressedEvent event,
    Emitter<SignInState> emit,
  ) async {
    try {
      emit(state.copyWith(status: SignInStatus.loading));

      await _signInUsecase.signInWithEmailAndPassword(
          email: state.email, password: state.password);

      emit(state.copyWith(status: SignInStatus.success));
    } on FirebaseAuthException catch (error, stack) {
      log('Erro ao realizar login do usuario com email e senha',
          error: error, stackTrace: stack);

      final String errorMessage;

      if (error.code == 'user-not-found' || error.code == 'wrong-password') {
        errorMessage =
            'E-mail ou Senha inválidos, confira seus dados e tente novamente.';
      } else if (error.code == 'invalid-email') {
        errorMessage = 'E-mail informado com formato inválido.';
      } else if (error.code == 'user-disabled') {
        errorMessage =
            'Usuário desativado, entre em contato com nosso suporte em caso de dúvida.';
      } else {
        errorMessage =
            'Ocorreu um erro ao realizar seu login, tente novamente mais tarde.';
      }

      emit(state.copyWith(status: SignInStatus.failure, message: errorMessage));
    } catch (error, stack) {
      log('Algum problema ao tenta execulta a funcção de login com email e senha do usuário',
          error: error, stackTrace: stack);

      emit(
        state.copyWith(
          status: SignInStatus.failure,
          message: 'Algo deu errado ao realizar seu login, tente novamente.',
        ),
      );
    }
  }

  Future<void> _handleSignInSetInitialStateEvent(
    SignInSetInitialStateEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(status: SignInStatus.initial));
  }
}
