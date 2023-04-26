import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthStateUsecase {
  Stream<User?> get authStateChanges;
}