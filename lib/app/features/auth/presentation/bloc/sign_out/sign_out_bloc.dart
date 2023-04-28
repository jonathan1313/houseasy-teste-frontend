import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/usecases/sign_out/sign_out_usecase.dart';

part 'sign_out_event.dart';
part 'sign_out_state.dart';

class SignOutBloc extends Bloc<SignOutEvent, SignOutState> {
  final SignOutUsecase _signOutUsecase;

  SignOutBloc({required signOutUsecase})
      : _signOutUsecase = signOutUsecase,
        super(const SignOutState()) {
    on<SignOutOnButtonPressedEvent>(_handleSignOutOnButtonPressedEvent);
  }

  Future<void> _handleSignOutOnButtonPressedEvent(
    SignOutOnButtonPressedEvent event,
    Emitter<SignOutState> emit,
  ) async {
    try {
      emit(state.copyWith(
          status: SignOutStatus.loading,
          message: 'Realizando logout, por favor aguarde.'));

      await _signOutUsecase.signOut();

      emit(state.copyWith(
          status: SignOutStatus.success,
          message: 'Logout realizado com sucesso.'));
    } on FirebaseAuthException catch (error, stack) {
      log('Ocorreu um erro ao realizar o logout do usuário',
          error: error, stackTrace: stack);
      emit(state.copyWith(
          status: SignOutStatus.failure,
          message:
              'Desculpe não foi possivel realizar seu logout, tente novamente.'));
    } catch (error, stack) {
      log('Ocorreu um erro ao realizar o logout do usuário',
          error: error, stackTrace: stack);
      emit(state.copyWith(
          status: SignOutStatus.failure,
          message:
              'Desculpe não foi possivel realizar seu logout, tente novamente.'));
    }
  }
}
