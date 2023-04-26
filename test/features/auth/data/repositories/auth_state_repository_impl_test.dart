import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';

import 'package:houseasy_teste_frontend/app/features/auth/data/repositories/auth_state_repository_impl.dart';
import 'package:houseasy_teste_frontend/app/features/auth/domain/usecases/auth_state/auth_state_usecase.dart';
import 'package:houseasy_teste_frontend/app/features/auth/domain/usecases/auth_state/auth_state_usecase_impl.dart';

void main() {
  test('should mockfirebase must be non-null for auth state', () {
    expect(MockFirebaseAuth().app, isNotNull);
  });

  group('emits an initial User? on startup: ', () {
    test('should return null if signed out', () async {
      final MockFirebaseAuth mockAuth = MockFirebaseAuth();
      final AuthStateUsecase authStateUsecase =
          AuthStateUsecaseImpl(AuthStateRepositoryImpl(mockAuth));

      expect(authStateUsecase.authStateChanges, emits(null));
    });

    test('should return a user if signed in', () async {
      final MockFirebaseAuth mockAuth = MockFirebaseAuth(signedIn: true);
      final AuthStateUsecase authStateUsecase =
          AuthStateUsecaseImpl(AuthStateRepositoryImpl(mockAuth));

      expect(authStateUsecase.authStateChanges, emitsInOrder([isA<User>()]));
    });
  });
}
