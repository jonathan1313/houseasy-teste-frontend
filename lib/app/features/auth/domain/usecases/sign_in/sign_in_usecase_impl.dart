import 'package:firebase_auth/firebase_auth.dart';

import '../../repositories/sign_in_repository.dart';
import 'sign_in_usecase.dart';

class SignInUsecaseImpl implements SignInUsecase {
  final SignInRepository _signInRepository;

  SignInUsecaseImpl(this._signInRepository);

  @override
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _signInRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
