part of 'random_list_generation_bloc.dart';

abstract class RandomListGenerationEvent extends Equatable {
  const RandomListGenerationEvent();

  @override
  List<Object> get props => [];
}

class FetchMoviesListEvent extends RandomListGenerationEvent {
  const FetchMoviesListEvent();
}
