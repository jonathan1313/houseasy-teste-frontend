import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/movie_model.dart';
import '../../widgets/random_movie_list_gradient_background.dart';
import '../../bloc/random_list_generation/random_list_generation_bloc.dart';

import 'components/random_list_generation_loading.dart';
import 'components/random_list_generation_movie_container_component.dart';

class RandomListGenerationView extends StatefulWidget {
  const RandomListGenerationView({super.key});

  @override
  State<RandomListGenerationView> createState() =>
      _RandomListGenerationViewState();
}

class _RandomListGenerationViewState extends State<RandomListGenerationView> {
  @override
  void initState() {
    context.read<RandomListGenerationBloc>().add(const FetchMoviesListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const RandomMovieListGradientBackground(),
          BlocBuilder<RandomListGenerationBloc, RandomListGenerationState>(
            builder: (context, state) {
              if (state.status == RandomListGenerationStatus.initial) {
                return const Center(
                  child: Text(
                    'Nenhum filme encontrado...',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                );
              }

              if (state.status == RandomListGenerationStatus.loading) {
                return const RandomListGenerationLoading();
              }

              if (state.status == RandomListGenerationStatus.loaded) {
                List<Movie> moviesList = state.moviesList ?? [];

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: moviesList.length,
                  itemBuilder: (context, index) {
                    return RandomListGenerationMovieContainerComponent(
                      movie: moviesList[index],
                    );
                  },
                );
              }

              return Container();
            },
          ),
          Positioned(
            top: 30.0,
            left: 5.0,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                context.pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
