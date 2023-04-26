import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/auth_state_repository.dart';

class AuthStateRepositoryImpl implements AuthStateRepository {
  
  final FirebaseAuth _firebaseAuth;

  AuthStateRepositoryImpl(this._firebaseAuth);
  
  @override
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  
}