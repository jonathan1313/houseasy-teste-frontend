import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/sign_up_repository.dart';

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
