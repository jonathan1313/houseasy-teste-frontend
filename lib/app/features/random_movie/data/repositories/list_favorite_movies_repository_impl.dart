import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/list_favorite_movies_repository.dart';

import '../models/movie_model.dart';

class ListFavoriteMoviesRepositoryImpl implements ListFavoriteMoviesRepository {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  ListFavoriteMoviesRepositoryImpl(
    this._firebaseFirestore,
    this._firebaseAuth,
  );

  @override
  Future<List<Movie>> getFavoriteMovies() async {
    try {
      final String idCurrentUser = _firebaseAuth.currentUser!.uid;

      final snapshot = await _firebaseFirestore
          .collection('favorite_movies')
          .doc(idCurrentUser)
          .collection('user_favorites')
          .get();

      return snapshot.docs.map((movie) => Movie.fromMap(movie.data())).toList();
    } on FirebaseException catch (error, stack) {
      log('Erro ao tenta recuperar o snapshot de listagem de favoritos do Firestore', error: error, stackTrace: stack);
      rethrow;
    } catch (error, stack) {
      log('Erro na função de listagem de favoritos', error: error, stackTrace: stack);
      rethrow;
    }
  }
}
