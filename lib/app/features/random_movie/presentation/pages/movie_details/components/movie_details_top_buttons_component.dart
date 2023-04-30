import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:houseasy_teste_frontend/app/core/helpers/size_extensions.dart';

import '../../../../data/models/movie_model.dart';
import '../../../bloc/save_movie_on_favorites_repository/save_movie_on_favorites_repository_bloc.dart';

class MovieDetailsTopButtonsComponent extends StatelessWidget {
  final Movie movie;

  const MovieDetailsTopButtonsComponent({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 35.0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        width: context.screenWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () => context.pop(),
            ),
            BlocBuilder<SaveMovieOnFavoritesRepositoryBloc,
                SaveMovieOnFavoritesRepositoryState>(
              builder: (context, state) {
                if (state.status ==
                    SaveMovieOnFavoritesRepositoryStatus.saved) {
                  return IconButton(
                    icon: Icon(
                      Icons.star,
                      color: Colors.yellow.shade700,
                      size: 30.0,
                    ),
                    onPressed: () {},
                  );
                }

                return IconButton(
                  icon: const Icon(
                    Icons.star_outline,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () => context
                      .read<SaveMovieOnFavoritesRepositoryBloc>()
                      .add(SaveNewFavotireMovie(movie: movie)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
