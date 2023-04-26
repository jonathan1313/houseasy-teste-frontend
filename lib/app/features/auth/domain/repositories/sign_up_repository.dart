import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpRepository {
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String userName,
  });
}
