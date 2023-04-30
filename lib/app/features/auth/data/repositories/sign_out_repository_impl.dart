import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/sign_out_repository.dart';

///
/// Faz o logout do usuario atual utilizando uma função do Firebase
/// não é nescesario passar parametros pois o logout é feiro atraves
/// da instancia atual do FirebaseAuth
/// essa função dispara uma ação que pode ser escultada pelo AuthState
///

class SignOutRepositoryImpl implements SignOutRepository {
  
  final FirebaseAuth _firebaseAuth;

  SignOutRepositoryImpl(this._firebaseAuth);
  
  @override
  Future<void> signOut() async {

    try {

      return await _firebaseAuth.signOut();
      
    } on FirebaseAuthException catch (error, stack) {
      log('Erro ao fazer o logoff do usuario', error: error, stackTrace: stack);
      rethrow;
    }

  }
  
}