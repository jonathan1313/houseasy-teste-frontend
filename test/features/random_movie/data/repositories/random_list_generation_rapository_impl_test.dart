import 'package:http/http.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:houseasy_teste_frontend/app/features/random_movie/data/models/movie_model.dart';
import 'package:houseasy_teste_frontend/app/core/services/http_client_service_impl.dart';
import 'package:houseasy_teste_frontend/app/features/random_movie/data/repositories/random_list_generation_rapository_impl.dart';
import 'package:houseasy_teste_frontend/app/features/random_movie/domain/usecases/random_list_generation/random_list_generation_usecase.dart';
import 'package:houseasy_teste_frontend/app/features/random_movie/domain/usecases/random_list_generation/random_list_generation_usecase_impl.dart';

void main() {

  final RandomListGenerationUsecase randomListGenerationRapository = RandomListGenerationUsecaseImpl(RandomListGenerationRapositoryImpl(HttpClientServiceImpl(Client())));
  
  test('shoul return a list with 5 results', () async {
    final List<Movie> moviesList = await randomListGenerationRapository.getMovies();
    expect(moviesList.length, 5); 
  });

}