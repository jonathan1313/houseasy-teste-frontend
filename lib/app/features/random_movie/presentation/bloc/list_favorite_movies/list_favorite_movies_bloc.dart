import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:houseasy_teste_frontend/app/features/random_movie/domain/usecases/list_favorite_movies/list_favorite_movies_usecase.dart';

import '../../../data/models/movie_model.dart';

part 'list_favorite_movies_event.dart';
part 'list_favorite_movies_state.dart';

class ListFavoriteMoviesBloc extends Bloc<
    ListFavoriteMoviesEvent, ListFavoriteMoviesState> {
  final ListFavoriteMoviesUsecase _listFavoriteMoviesUsecase;

  ListFavoriteMoviesBloc({required listFavoriteMoviesUsecase})
      : _listFavoriteMoviesUsecase = listFavoriteMoviesUsecase,
        super(const ListFavoriteMoviesState()) {
    on<FetchFavoriteMoviesListEvent>(_handleFetchFavoriteMoviesListEvent);
  }

  Future<void> _handleFetchFavoriteMoviesListEvent(
    FetchFavoriteMoviesListEvent event,
    Emitter<ListFavoriteMoviesState> emit,
  ) async {
    try {
      emit(state.copyWith(status: ListFavoriteMoviesStatus.loading, message: 'Carregando sua lista de favoritos...'));

      List<Movie> movieList = await _listFavoriteMoviesUsecase.getFavoriteMovies();

      emit(state.copyWith(status: ListFavoriteMoviesStatus.loaded, movieList: movieList, message: 'Lista de favoritos carregada com sucesso'));
      
    } on FirebaseException catch (error, stack) {
      log('Erro recuperar lista de favoritos do usuário', error: error, stackTrace: stack);
      emit(state.copyWith(status: ListFavoriteMoviesStatus.failure, message: 'Não foi possivel recuperar sua listagem, por favor tente novamente.'));
    } catch (error, stack) {
      log('Erro ao execulta função de recuperar lista de favoritos', error: error, stackTrace: stack);
      emit(state.copyWith(status: ListFavoriteMoviesStatus.failure, message: 'Ocorreu um erro ao recuperar as informações, por favor tente novamente.'));
    }

  }
}
