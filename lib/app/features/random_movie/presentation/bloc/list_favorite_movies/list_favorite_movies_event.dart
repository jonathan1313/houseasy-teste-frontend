part of 'list_favorite_movies_bloc.dart';

abstract class ListFavoriteMoviesEvent extends Equatable {
  const ListFavoriteMoviesEvent();

  @override
  List<Object> get props => [];
}

class FetchFavoriteMoviesListEvent extends ListFavoriteMoviesEvent {
  const FetchFavoriteMoviesListEvent();
}
