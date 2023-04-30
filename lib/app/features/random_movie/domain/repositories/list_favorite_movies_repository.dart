import '../../data/models/movie_model.dart';

abstract class ListFavoriteMoviesRepository {
  Future<List<Movie>> getFavoriteMovies();
}