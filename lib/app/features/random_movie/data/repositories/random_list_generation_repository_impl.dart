import 'dart:math';

import '../../../../core/configs/api_tmdb_constants.dart';
import '../../../../core/services/http_client_service.dart';

import '../../domain/repositories/random_list_generation_repository.dart';

import '../models/movie_model.dart';

class RandomListGenerationRepositoryImpl
    implements RandomListGenerationRepository {
  final HttpClientService _clientService;
  RandomListGenerationRepositoryImpl(this._clientService);

  @override
  Future<List<Movie>> getMovies() async {
    try {
      var random = Random();
      final int randomPage = random.nextInt(200) + 1;

      var result = await _clientService.request(
          url: '${ApiTmdbConstants.listForPopularity}${randomPage.toString()}',
          method: 'get');

      final List<Movie> moviesList = Movies.fromJson(result).listMovies;
      moviesList.shuffle();

      return moviesList.take(5).toList();
    } catch (error, stack) {
      rethrow;
    }
  }
}
