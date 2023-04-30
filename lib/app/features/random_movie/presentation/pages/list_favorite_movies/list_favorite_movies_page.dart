import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/list_favorite_movies_repository_impl.dart';
import '../../../domain/usecases/list_favorite_movies/list_favorite_movies_usecase.dart';
import '../../../domain/usecases/list_favorite_movies/list_favorite_movies_usecase_impl.dart';
import '../../bloc/list_favorite_movies/list_favorite_movies_bloc.dart';

import 'list_favorite_movies_view.dart';

class ListFavoriteMoviesPage extends StatelessWidget {
  ListFavoriteMoviesPage({super.key});

  final ListFavoriteMoviesUsecase _listFavoriteMoviesUsecase = ListFavoriteMoviesUsecaseImpl(ListFavoriteMoviesRepositoryImpl(FirebaseFirestore.instance, FirebaseAuth.instance));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListFavoriteMoviesBloc(listFavoriteMoviesUsecase: _listFavoriteMoviesUsecase),
      child: const ListFavoriteMoviesView(),
    );
  }
}
