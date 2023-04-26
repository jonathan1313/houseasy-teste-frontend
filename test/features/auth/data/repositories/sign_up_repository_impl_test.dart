import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';

import 'package:houseasy_teste_frontend/app/features/auth/data/repositories/sign_up_repository_impl.dart';
import 'package:houseasy_teste_frontend/app/features/auth/domain/usecases/sign_up/sign_up_usecase.dart';
import 'package:houseasy_teste_frontend/app/features/auth/domain/usecases/sign_up/sign_up_usecase_impl.dart';
import 'package:mock_exceptions/mock_exceptions.dart';

void main() {
  test('should mockfirebase must be non-null for sign up', () {
    expect(MockFirebaseAuth().app, isNotNull);
  });

  test(
      'should returns a mocked user user after sign up with email and password',
      () async {
    const email = 'some@email.com';
    const password = 'some!password';
    const username = 'Some User Name';
    final MockFirebaseAuth mockAuth = MockFirebaseAuth();
    final SignUpUsecase signUpUsecase =
        SignUpUsecaseImpl(SignUpRepositoryImpl(mockAuth));
    final result = await signUpUsecase.createUserWithEmailAndPassword(
        email: email, password: password, userName: username);
    final user = result.user!;
    expect(user.email, email);
    expect(mockAuth.authStateChanges(), emitsInOrder([null, isA<User>()]));
    expect(mockAuth.userChanges(), emitsInOrder([null, isA<User>()]));
    expect(user.isAnonymous, isFalse);
  });

  test('should thorw a exception when createUserWithEmailAndPassword',
      () async {
    
    final MockFirebaseAuth mockAuth = MockFirebaseAuth();
    final SignUpUsecase signUpUsecase =
        SignUpUsecaseImpl(SignUpRepositoryImpl(mockAuth));

    whenCalling(Invocation.method(#createUserWithEmailAndPassword, null))
        .on(mockAuth)
        .thenThrow(FirebaseAuthException(code: 'bla'));
    
    expect(
      () => signUpUsecase.createUserWithEmailAndPassword(
          email: '', password: '', userName: ''),
      throwsA(isA<FirebaseAuthException>()),
    );
  });
}
