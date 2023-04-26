import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpUsecase {
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String userName,
  });
}
