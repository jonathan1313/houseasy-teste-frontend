import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';

import 'package:houseasy_teste_frontend/app/features/auth/data/repositories/sign_out_repository_impl.dart';
import 'package:houseasy_teste_frontend/app/features/auth/domain/usecases/sign_out/sign_out_usecase.dart';
import 'package:houseasy_teste_frontend/app/features/auth/domain/usecases/sign_out/sign_out_usecase_impl.dart';

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
  test('should mockfirebase must be non-null for sign out', () {
    expect(MockFirebaseAuth().app, isNotNull);
  });

  test('should returns null after sign out', () async {
    final MockFirebaseAuth mockAuth = MockFirebaseAuth(signedIn: true, mockUser: mockUser);
    final SignOutUsecase signOutUsecase = SignOutUsecaseImpl(SignOutRepositoryImpl(mockAuth));

    final user = mockAuth.currentUser;

    await signOutUsecase.signOut();

    expect(mockAuth.currentUser, isNull);
    expect(mockAuth.authStateChanges(), emitsInOrder([user, null]));
    expect(mockAuth.userChanges(), emitsInOrder([user, null]));
  });
}