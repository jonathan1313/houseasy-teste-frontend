import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:houseasy_teste_frontend/app/core/styles/custom_theme.dart';

import '../../../data/models/movie_model.dart';
import '../../bloc/list_favorite_movies/list_favorite_movies_bloc.dart';

class ListFavoriteMoviesView extends StatelessWidget {
  const ListFavoriteMoviesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context
        .read<ListFavoriteMoviesBloc>()
        .add(const FetchFavoriteMoviesListEvent());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomTheme.color.shade900,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 1,
        title: const Text(
          'Favoritos',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<ListFavoriteMoviesBloc, ListFavoriteMoviesState>(
        builder: (context, state) {
          if (state.status == ListFavoriteMoviesStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == ListFavoriteMoviesStatus.loaded) {
            List<Movie> movieList = state.movieList ?? [];

            return ListView.builder(
              itemCount: movieList.length,
              itemBuilder: (context, index) {
                return Text(movieList[index].title ?? '');
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
