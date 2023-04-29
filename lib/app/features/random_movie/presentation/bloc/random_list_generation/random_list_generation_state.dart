part of 'random_list_generation_bloc.dart';

enum RandomListGenerationStatus {
  initial,
  loading,
  loaded,
  failure,
}

class RandomListGenerationState extends Equatable {
  final String message;
  final RandomListGenerationStatus status;
  final List<Movie>? moviesList;

  const RandomListGenerationState({
    this.message = '',
    this.status = RandomListGenerationStatus.initial,
    this.moviesList,
  });

  RandomListGenerationState copyWith({
    final String? message,
    final RandomListGenerationStatus? status,
    final List<Movie>? moviesList,
  }) {
    return RandomListGenerationState(
      message: message ?? this.message,
      status: status ?? this.status,
      moviesList: moviesList ?? this.moviesList,
    );
  }

  @override
  List<Object?> get props => [
        message,
        status,
        moviesList,
      ];
}
