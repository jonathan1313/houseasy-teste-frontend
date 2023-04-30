import 'dart:math';

import '../../../../core/configs/api_tmdb_constants.dart';
import '../../../../core/services/http_client_service.dart';

import '../../domain/repositories/random_list_generation_repository.dart';

import '../models/movie_model.dart';

///
/// Essa função retorna 5 filmes aleatorio de uma lista
/// atualmente usando a API do The Movies Data Base
/// a API não fornece um end-point para resultados aleatorios
/// sendo assim é feita uma requisição normal organizando por filmes mais populares de forma decrescente
/// é passado um paramento de paginação
/// um numero aleatorio é gerado (1 a 200) que sera o numero da pagina
/// cada pagina possui 20 resultados, possibilitando assim 4000 filmes
/// apos que a lista é recuperada ela é embaralhada 
/// e é retornado os 5 primeiros resultados
///

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
    } catch (error) {
      rethrow;
    }
  }
}
