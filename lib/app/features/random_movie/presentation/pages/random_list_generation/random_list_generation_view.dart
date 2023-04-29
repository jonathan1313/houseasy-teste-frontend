import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:houseasy_teste_frontend/app/core/configs/api_tmdb_constants.dart';
import 'package:houseasy_teste_frontend/app/core/helpers/size_extensions.dart';

import '../../../../../core/styles/custom_theme.dart';
import '../../../data/models/movie_model.dart';
import '../../bloc/random_list_generation/random_list_generation_bloc.dart';
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
      body: BlocBuilder<RandomListGenerationBloc, RandomListGenerationState>(
        builder: (context, state) {
          if (state.status == RandomListGenerationStatus.initial) {
            return const Center(
              child: Text('Nenhum filminho ainda'),
            );
          }

          if (state.status == RandomListGenerationStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == RandomListGenerationStatus.loaded) {
            List<Movie> moviesList = state.moviesList ?? [];

            return Stack(
              children: [
                Container(
                  width: context.screenWidth,
                  height: context.screenHeight,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        CustomTheme.color.shade400,
                        CustomTheme.color.shade900,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                ),
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: moviesList.length,
                  itemBuilder: (context, index) {
                    return RandomListGenerationMovieContainerComponent(
                      movie: moviesList[index],
                    );
                  },
                ),
              ],
            );
          }

          return Container();
        },
      ),
    );
  }
}
