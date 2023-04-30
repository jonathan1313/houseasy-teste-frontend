import '../../data/models/movie_model.dart';

abstract class RandomListGenerationRepository {
  Future<List<Movie>> getMovies();
}
