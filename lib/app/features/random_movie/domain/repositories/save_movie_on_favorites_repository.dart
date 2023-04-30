import '../../data/models/movie_model.dart';

abstract class SaveMovieOnFavoritesRepository {
  Future<void> saveNewFavorite({required Movie movie});
}