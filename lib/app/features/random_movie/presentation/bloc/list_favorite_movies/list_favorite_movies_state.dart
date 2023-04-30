part of 'list_favorite_movies_bloc.dart';

enum ListFavoriteMoviesStatus {
  initial,
  loading,
  loaded,
  failure,
}

class ListFavoriteMoviesState extends Equatable {
  final String message;
  final ListFavoriteMoviesStatus status;
  final List<Movie>? movieList;

  const ListFavoriteMoviesState({
    this.message = '',
    this.status = ListFavoriteMoviesStatus.initial,
    this.movieList,
  });

  ListFavoriteMoviesState copyWith({
    String? message,
    ListFavoriteMoviesStatus? status,
    List<Movie>? movieList,
  }) {
    return ListFavoriteMoviesState(
      message: message ?? this.message,
      status: status ?? this.status,
      movieList: movieList ?? this.movieList,
    );
  }

  @override
  List<Object?> get props => [
        message,
        status,
        movieList,
      ];
}
