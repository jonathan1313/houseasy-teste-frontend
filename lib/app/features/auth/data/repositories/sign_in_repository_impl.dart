import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/sign_in_repository.dart';

///
/// Faz o login do usuario atravez de uma função do Firebase, utilizando E-mail e Senha
/// retorna um objeto do tipo UserCredential, que pode ser utilizado para 
/// recuperar as informações do usuario
/// essa função dispara uma ação que pode ser escultada pelo AuthState
///

class SignInRepositoryImpl implements SignInRepository {

  final FirebaseAuth _firebaseAuth;
  SignInRepositoryImpl(this._firebaseAuth);

  @override
  Future<UserCredential> signInWithEmailAndPassword({required String email, required String password}) async {
    try {

      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
      
    } on FirebaseAuthException catch (error, stack) {
      log('Erro ao realizar login de usuario com email e senha', error: error, stackTrace: stack);
      rethrow;
    }

  }
  
}