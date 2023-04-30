import '../../../data/models/movie_model.dart';
import '../../repositories/save_movie_on_favorites_repository.dart';

import 'save_movie_on_favorites_usecase.dart';

class SaveMovieOnFavoritesUsecaseImpl implements SaveMovieOnFavoritesUsecase {
  final SaveMovieOnFavoritesRepository _saveMovieOnFavoritesRepository;

  SaveMovieOnFavoritesUsecaseImpl(this._saveMovieOnFavoritesRepository);

  @override
  Future<void> saveNewFavorite({required Movie movie}) {
    return _saveMovieOnFavoritesRepository.saveNewFavorite(movie: movie);
  }
}
