import 'package:flutter/material.dart';

import '../../../../../core/styles/custom_theme.dart';
import '../../../data/models/movie_model.dart';

import 'components/movie_details_infos_component.dart';
import 'components/movie_details_over_gradient_component.dart';
import 'components/movie_details_post_image_component.dart';
import 'components/movie_details_top_buttons_component.dart';

class MovieDetailsView extends StatelessWidget {
  final Movie movie;

  const MovieDetailsView({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.color.shade900,
      body: Stack(
        children: [
          MovieDetailsPostImageComponent(heroTag: movie.title!, posterPath: movie.getPostImage()),
          const MovieDetailsOverGradientComponent(),
          MovieDetailsInfosComponent(
            releaseYear: movie.getReleaseYear(),
            voteAverage: movie.voteAverage.toString(),
            title: movie.title ?? '',
            overview: movie.overview ?? '',
          ),
          MovieDetailsTopButtonsComponent(movie: movie),
        ],
      ),
    );
  }
}
