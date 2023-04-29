import '../../../data/models/movie_model.dart';

abstract class RandomListGenerationUsecase {
  Future<List<Movie>> getMovies();
}