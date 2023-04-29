import 'package:houseasy_teste_frontend/app/features/random_movie/domain/repositories/random_list_generation_rapository.dart';

import '../../../data/models/movie_model.dart';
import 'random_list_generation_usecase.dart';

class RandomListGenerationUsecaseImpl implements RandomListGenerationUsecase {
  final RandomListGenerationRapository _randomListGenerationRapository;

  RandomListGenerationUsecaseImpl(this._randomListGenerationRapository);

  @override
  Future<List<Movie>> getMovies() {
    return _randomListGenerationRapository.getMovies();
  }
}
