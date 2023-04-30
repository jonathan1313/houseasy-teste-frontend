import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../../data/models/movie_model.dart';
import '../../../domain/usecases/save_movie_on_favorites/save_movie_on_favorites_usecase.dart';

part 'save_movie_on_favorites_repository_event.dart';
part 'save_movie_on_favorites_repository_state.dart';

class SaveMovieOnFavoritesRepositoryBloc extends Bloc<
    SaveMovieOnFavoritesRepositoryEvent, SaveMovieOnFavoritesRepositoryState> {
  final SaveMovieOnFavoritesUsecase _saveMovieOnFavoritesUsecase;

  SaveMovieOnFavoritesRepositoryBloc({required saveMovieOnFavoritesUsecase})
      : _saveMovieOnFavoritesUsecase = saveMovieOnFavoritesUsecase,
        super(const SaveMovieOnFavoritesRepositoryState()) {
    on<SaveNewFavotireMovie>(_handleSaveNewFavotireMovie);
  }

  Future<void> _handleSaveNewFavotireMovie(
    SaveNewFavotireMovie event,
    Emitter<SaveMovieOnFavoritesRepositoryState> emit,
  ) async {
    try {
      emit(state.copyWith(
          status: SaveMovieOnFavoritesRepositoryStatus.loading,
          message: 'Registrando favorito, por favar aguarde...'));

      await _saveMovieOnFavoritesUsecase.saveNewFavorite(movie: event.movie);

      emit(
        state.copyWith(
            status: SaveMovieOnFavoritesRepositoryStatus.saved,
            message: 'Novo favorito registrado com sucesso.'),
      );
    } on FirebaseException catch (error, stack) {
      log('Erro ao salvar registo na lista de favoritos do usuário.',
          error: error, stackTrace: stack);
      emit(state.copyWith(
          status: SaveMovieOnFavoritesRepositoryStatus.failure,
          message:
              'Desculpe, não foi possivel registrar seu novo favorito, por favor tente novamente.'));
    }
  }
}
