import 'package:firebase_auth/firebase_auth.dart';

abstract class CurrentUserUsecase {
  User? get getCurrentUser;
}