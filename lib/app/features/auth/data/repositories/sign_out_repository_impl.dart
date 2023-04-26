import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/sign_out_repository.dart';

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