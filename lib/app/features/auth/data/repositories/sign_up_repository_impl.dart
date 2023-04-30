import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/sign_up_repository.dart';

///
/// Essa função faz o cadastro do usuario utilizando E-mail e Senha,
/// utilizando uma função do FirebaseAuth
/// apos o cadastro um obejeto do tipo UserCredential é recebido
/// com esse objeto é possivel execulta a função que atualiza o nome do usuario
/// essa função dispara uma ação que pode ser escultada pelo AuthState
///

class SignUpRepositoryImpl implements SignUpRepository {
  final FirebaseAuth _firebaseAuth;

  SignUpRepositoryImpl(this._firebaseAuth);

  @override
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String userName,
  }) async {
    try {

      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      await userCredential.user!.updateDisplayName(userName);

      return userCredential;
      
    } on FirebaseAuthException catch (error, stack) {
      log('Erro ao realizar o cadastro do usuario com email e senhas', error: error, stackTrace: stack);
      rethrow;
    } catch (error) {
      rethrow;
    }
  }
}
