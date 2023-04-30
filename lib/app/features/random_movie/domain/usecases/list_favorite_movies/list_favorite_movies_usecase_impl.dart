import '../../../data/models/movie_model.dart';
import '../../repositories/list_favorite_movies_repository.dart';

import 'list_favorite_movies_usecase.dart';

class ListFavoriteMoviesUsecaseImpl implements ListFavoriteMoviesUsecase {
  final ListFavoriteMoviesRepository _listFavoriteMoviesRepository;

  ListFavoriteMoviesUsecaseImpl(this._listFavoriteMoviesRepository);

  @override
  Future<List<Movie>> getFavoriteMovies() {
    return _listFavoriteMoviesRepository.getFavoriteMovies();
  }
}
