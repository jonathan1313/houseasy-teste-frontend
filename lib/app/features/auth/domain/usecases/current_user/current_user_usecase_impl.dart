import 'package:firebase_auth/firebase_auth.dart';

import '../../repositories/current_user_repository.dart';
import 'current_user_usecase.dart';

class CurrentUserUsecaseImpl implements CurrentUserUsecase {

  final CurrentUserRepository _currentUserRepository;

  CurrentUserUsecaseImpl(this._currentUserRepository);

  @override
  User? get getCurrentUser => _currentUserRepository.getCurrentUser;

}