import 'package:firebase_auth/firebase_auth.dart';

import '../../repositories/auth_state_repository.dart';
import 'auth_state_usecase.dart';

class AuthStateUsecaseImpl implements AuthStateUsecase {

  final AuthStateRepository _authStateRepository;

  AuthStateUsecaseImpl(this._authStateRepository);
  
  @override
  Stream<User?> get authStateChanges => _authStateRepository.authStateChanges;
  
}