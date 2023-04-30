import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:houseasy_teste_frontend/app/features/random_movie/data/repositories/save_movie_on_favorites_repository_impl.dart';
import 'package:houseasy_teste_frontend/app/features/random_movie/domain/usecases/save_movie_on_favorites/save_movie_on_favorites_usecase.dart';
import 'package:houseasy_teste_frontend/app/features/random_movie/domain/usecases/save_movie_on_favorites/save_movie_on_favorites_usecase_impl.dart';

import '../../../data/models/movie_model.dart';
import '../../bloc/save_movie_on_favorites_repository/save_movie_on_favorites_repository_bloc.dart';

import 'movie_details_view.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movie;

  MovieDetailsPage({
    super.key,
    required this.movie,
  });

  final SaveMovieOnFavoritesUsecase _saveMovieOnFavoritesUsecase = SaveMovieOnFavoritesUsecaseImpl(SaveMovieOnFavoritesRepositoryImpl(FirebaseFirestore.instance, FirebaseAuth.instance));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SaveMovieOnFavoritesRepositoryBloc(saveMovieOnFavoritesUsecase: _saveMovieOnFavoritesUsecase),
      child: MovieDetailsView(movie: movie),
    );
  }
}
