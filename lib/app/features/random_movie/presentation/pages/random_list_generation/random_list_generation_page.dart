import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/http_client_service_impl.dart';
import '../../bloc/random_list_generation/random_list_generation_bloc.dart';
import '../../../data/repositories/random_list_generation_repository_impl.dart';
import '../../../domain/usecases/random_list_generation/random_list_generation_usecase.dart';
import '../../../domain/usecases/random_list_generation/random_list_generation_usecase_impl.dart';

import 'random_list_generation_view.dart';

class RandomListGenerationPage extends StatelessWidget {
  RandomListGenerationPage({super.key});

  final RandomListGenerationUsecase _randomListGenerationUsecase =
      RandomListGenerationUsecaseImpl(
          RandomListGenerationRepositoryImpl(HttpClientServiceImpl(Client())));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RandomListGenerationBloc(
          randomListGenerationUsecase: _randomListGenerationUsecase),
      child: const RandomListGenerationView(),
    );
  }
}
