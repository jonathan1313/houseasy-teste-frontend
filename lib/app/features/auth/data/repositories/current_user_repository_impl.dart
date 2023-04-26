import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/current_user_repository.dart';

class CurrentUserRepositoryImpl implements CurrentUserRepository {

  final FirebaseAuth _firebaseAuth;

  CurrentUserRepositoryImpl(this._firebaseAuth);

  @override
  User? get getCurrentUser => _firebaseAuth.currentUser;  
  
}