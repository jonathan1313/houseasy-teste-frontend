import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/movie_model.dart';
import '../../bloc/random_list_generation/random_list_generation_bloc.dart';

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
      appBar: AppBar(),
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

            return ListView.builder(
              itemCount: moviesList.length,
              itemBuilder: (context, index) {
                return Text(moviesList[index].title ?? '');
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
