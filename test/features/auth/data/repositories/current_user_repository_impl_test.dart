import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';

import 'package:houseasy_teste_frontend/app/features/auth/data/repositories/current_user_repository_impl.dart';
import 'package:houseasy_teste_frontend/app/features/auth/domain/usecases/current_user/current_user_usecase.dart';
import 'package:houseasy_teste_frontend/app/features/auth/domain/usecases/current_user/current_user_usecase_impl.dart';

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
  test('should mockfirebase must be non-null for current user', () {
    expect(MockFirebaseAuth().app, isNotNull);
  });

  test('should returns no user if not signed in', () async {
    final MockFirebaseAuth mockFirebaseAuth = MockFirebaseAuth();
    final CurrentUserUsecase currentUserUsecase =
        CurrentUserUsecaseImpl(CurrentUserRepositoryImpl(mockFirebaseAuth));
    final user = currentUserUsecase.getCurrentUser;
    expect(user, isNull);
  });

  test('should returns a mocked user if already signed in', () async {
    final MockFirebaseAuth mockFirebaseAuth =
        MockFirebaseAuth(signedIn: true, mockUser: mockUser);
    final CurrentUserUsecase currentUserUsecase =
        CurrentUserUsecaseImpl(CurrentUserRepositoryImpl(mockFirebaseAuth));
    final user = currentUserUsecase.getCurrentUser;
    expect(user, mockUser);
  });

  test('should send verification email', () async {
    final MockFirebaseAuth mockFirebaseAuth =
        MockFirebaseAuth(signedIn: true, mockUser: mockUser);
    final CurrentUserUsecase currentUserUsecase =
        CurrentUserUsecaseImpl(CurrentUserRepositoryImpl(mockFirebaseAuth));
    final user = currentUserUsecase.getCurrentUser;
    expect(user?.sendEmailVerification(), completes);
  });

  test('shold user.sendEmailVerification can throw exception', () async {
    final MockFirebaseAuth mockFirebaseAuth =
        MockFirebaseAuth(signedIn: true, mockUser: mockUser);
    mockUser.exception = FirebaseAuthException(code: 'verification-failure');
    final CurrentUserUsecase currentUserUsecase =
        CurrentUserUsecaseImpl(CurrentUserRepositoryImpl(mockFirebaseAuth));
    final user = currentUserUsecase.getCurrentUser;
    expect(
      () => user?.sendEmailVerification(),
      throwsA(isA<FirebaseAuthException>()),
    );
  });

  test('should user.reload returns', () async {
    final MockFirebaseAuth mockFirebaseAuth = MockFirebaseAuth(signedIn: true);
    final CurrentUserUsecase currentUserUsecase =
        CurrentUserUsecaseImpl(CurrentUserRepositoryImpl(mockFirebaseAuth));
    final user = currentUserUsecase.getCurrentUser;
    expect(user, isNotNull);
    await user!.reload();
  });

  test('should user.updateDisplayName changes displayName', () async {
    final MockFirebaseAuth mockFirebaseAuth =
        MockFirebaseAuth(signedIn: true, mockUser: mockUser.copyWith());
    final CurrentUserUsecase currentUserUsecase =
        CurrentUserUsecaseImpl(CurrentUserRepositoryImpl(mockFirebaseAuth));
    final user = currentUserUsecase.getCurrentUser;
    await user!.updateDisplayName('New Bob');
    expect(user.displayName, 'New Bob');
  });

  test('should user.updatePassword works', () async {
    final MockFirebaseAuth mockFirebaseAuth =
        MockFirebaseAuth(signedIn: true, mockUser: mockUser);
    final CurrentUserUsecase currentUserUsecase =
        CurrentUserUsecaseImpl(CurrentUserRepositoryImpl(mockFirebaseAuth));
    final user = currentUserUsecase.getCurrentUser;
    expect(
      () => user!.updatePassword('newPassword'),
      returnsNormally,
    );
  });

  test('should user.updatePassword can throw exception', () async {
    final MockFirebaseAuth mockFirebaseAuth =
        MockFirebaseAuth(signedIn: true, mockUser: mockUser);
    mockUser.exception = FirebaseAuthException(code: 'weak-password');
    final CurrentUserUsecase currentUserUsecase =
        CurrentUserUsecaseImpl(CurrentUserRepositoryImpl(mockFirebaseAuth));
    final user = currentUserUsecase.getCurrentUser;
    expect(
      () => user!.updatePassword('newPassword'),
      throwsA(isA<FirebaseAuthException>()),
    );
  });

  test('should user.delete works', () async {
    final MockFirebaseAuth mockFirebaseAuth =
        MockFirebaseAuth(signedIn: true, mockUser: mockUser);
    final CurrentUserUsecase currentUserUsecase =
        CurrentUserUsecaseImpl(CurrentUserRepositoryImpl(mockFirebaseAuth));
    final user = currentUserUsecase.getCurrentUser;
    expect(
      () => user!.delete(),
      returnsNormally,
    );
  });
}