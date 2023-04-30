import '../../../data/models/movie_model.dart';

abstract class ListFavoriteMoviesUsecase {
  Future<List<Movie>> getFavoriteMovies();
}