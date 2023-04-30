import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/save_movie_on_favorites_repository.dart';
import '../models/movie_model.dart';

class SaveMovieOnFavoritesRepositoryImpl implements SaveMovieOnFavoritesRepository {

  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  SaveMovieOnFavoritesRepositoryImpl(
    this._firebaseFirestore,
    this._firebaseAuth,
  );

  @override
  Future<void> saveNewFavorite({required Movie movie}) async {
    try {
      final String idCurrentUser = _firebaseAuth.currentUser!.uid;
      await _firebaseFirestore.collection('favorite_movies').doc(idCurrentUser).collection('user_favorites').add(movie.toMap());
    } on FirebaseException catch (error, stack) {
      log('Erro ao registrar filme no Firestore', error: error, stackTrace: stack);
      rethrow;
    }
  }
  
}
