import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/movie_model.dart';
import '../../../domain/usecases/random_list_generation/random_list_generation_usecase.dart';


part 'random_list_generation_event.dart';
part 'random_list_generation_state.dart';

class RandomListGenerationBloc
    extends Bloc<RandomListGenerationEvent, RandomListGenerationState> {
  final RandomListGenerationUsecase _randomListGenerationUsecase;

  RandomListGenerationBloc({required randomListGenerationUsecase})
      : _randomListGenerationUsecase = randomListGenerationUsecase,
        super(const RandomListGenerationState()) {
    on<FetchMoviesListEvent>(_handleFetchMoviesListEvent);
  }

  Future<void> _handleFetchMoviesListEvent(
    FetchMoviesListEvent event,
    Emitter emit,
  ) async {
    try {
      emit(state.copyWith(
          status: RandomListGenerationStatus.loading,
          message: 'Escolhendo filmes para indicar para você!'));

      final List<Movie> moviesList =
          await _randomListGenerationUsecase.getMovies();

      emit(state.copyWith(
          status: RandomListGenerationStatus.loaded, moviesList: moviesList));
    } catch (error, stack) {
      log('Error ao recuperar lista de indicações para o usuário',
          error: error, stackTrace: stack);
      emit(state.copyWith(
          status: RandomListGenerationStatus.failure,
          message:
              'Desculpe, não foi possivel recuperar a lista de indicações, tente novamente.'));
    }
  }
}
