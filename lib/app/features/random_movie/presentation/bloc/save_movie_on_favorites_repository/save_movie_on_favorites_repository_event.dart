part of 'save_movie_on_favorites_repository_bloc.dart';

abstract class SaveMovieOnFavoritesRepositoryEvent extends Equatable {
  const SaveMovieOnFavoritesRepositoryEvent();

  @override
  List<Object> get props => [];
}

class SaveNewFavotireMovie extends SaveMovieOnFavoritesRepositoryEvent {
  final Movie movie;

  const SaveNewFavotireMovie({required this.movie});

  @override
  List<Object> get props => [movie];
}
