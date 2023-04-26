import 'package:firebase_auth/firebase_auth.dart';

import 'sign_up_usecase.dart';
import '../../repositories/sign_up_repository.dart';

class SignUpUsecaseImpl implements SignUpUsecase {
  final SignUpRepository _signUpRepository;

  SignUpUsecaseImpl(this._signUpRepository);

  @override
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String userName,
  }) {
    return _signUpRepository.createUserWithEmailAndPassword(
      email: email,
      password: password,
      userName: userName,
    );
  }
}
