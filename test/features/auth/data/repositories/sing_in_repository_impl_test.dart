import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:mock_exceptions/mock_exceptions.dart';

import 'package:houseasy_teste_frontend/app/features/auth/data/repositories/sign_in_repository_impl.dart';
import 'package:houseasy_teste_frontend/app/features/auth/domain/usecases/sign_in/sign_in_usecase.dart';
import 'package:houseasy_teste_frontend/app/features/auth/domain/usecases/sign_in/sign_in_usecase_impl.dart';

final mockUser = MockUser(
  isAnonymous: false,
  uid: 'someuid',
  email: 'frojho@houseasy.net',
  displayName: 'FroJho',
  phoneNumber: '0800 0 000 000 00',
  photoURL: 'http://photos.url/bobbie.jpg',
  refreshToken: 'some_long_token',
);

void main() {
  test('should mockfirebase must be non-null for sign with email and password', () {
    expect(MockFirebaseAuth().app, isNotNull);
  });

  test('should sign in a user with email and password', () async {
    final MockFirebaseAuth mockAuth = MockFirebaseAuth(mockUser: mockUser);
    final SignInUsecase signInUsecase = SignInUsecaseImpl(SignInRepositoryImpl(mockAuth));
    
    final result = await signInUsecase.signInWithEmailAndPassword(
        email: 'frojho@houseasy.net', password: 'Test@123');

    final user = result.user;
    expect(user, mockUser);
    expect(mockAuth.authStateChanges(), emitsInOrder([null, isA<User>()]));
    expect(mockAuth.userChanges(), emitsInOrder([null, isA<User>()]));
  });

  test('should return a type UserCredential', () async {
    final MockFirebaseAuth mockAuth = MockFirebaseAuth();
    final SignInUsecase signInUsecase =
        SignInUsecaseImpl(SignInRepositoryImpl(mockAuth));

    final result = await signInUsecase.signInWithEmailAndPassword(
        email: 'frojho@somedomain.com', password: 'Test@123');

    expect(result, isA<UserCredential>());
  });

  test('should have a exception when sign in with email and password',
      () async {
    final MockFirebaseAuth mockAuth = MockFirebaseAuth(signedIn: false);
    final SignInUsecase signInUsecase =
        SignInUsecaseImpl(SignInRepositoryImpl(mockAuth));

    whenCalling(Invocation.method(#signInWithEmailAndPassword, null))
        .on(mockAuth)
        .thenThrow(FirebaseAuthException(code: 'veronica'));
    expect(
      () => signInUsecase.signInWithEmailAndPassword(email: '', password: ''),
      throwsA(isA<FirebaseAuthException>()),
    );
  });

}