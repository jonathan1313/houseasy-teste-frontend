import '../../data/models/movie_model.dart';

abstract class RandomListGenerationRapository {
  Future<List<Movie>> getMovies();
}
