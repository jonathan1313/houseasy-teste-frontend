import '../../../data/models/movie_model.dart';

abstract class SaveMovieOnFavoritesUsecase {
  Future<void> saveNewFavorite({required Movie movie});
}