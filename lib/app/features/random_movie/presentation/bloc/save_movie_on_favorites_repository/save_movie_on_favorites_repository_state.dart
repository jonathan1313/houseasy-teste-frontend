part of 'save_movie_on_favorites_repository_bloc.dart';

enum SaveMovieOnFavoritesRepositoryStatus {
  inital,
  onTaped,
  loading,
  saved,
  failure,
}

class SaveMovieOnFavoritesRepositoryState extends Equatable {
  final String message;
  final SaveMovieOnFavoritesRepositoryStatus status;
  final Movie? movie;

  const SaveMovieOnFavoritesRepositoryState({
    this.message = '',
    this.status = SaveMovieOnFavoritesRepositoryStatus.inital,
    this.movie,
  });

  SaveMovieOnFavoritesRepositoryState copyWith({
    String? message,
    SaveMovieOnFavoritesRepositoryStatus? status,
    Movie? movie,
  }) {
    return SaveMovieOnFavoritesRepositoryState(
      message: message ?? this.message,
      status: status ?? this.status,
      movie: movie ?? movie,
    );
  }

  @override
  List<Object?> get props => [
        message,
        status,
        movie,
      ];
}
