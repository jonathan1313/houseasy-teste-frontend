import 'package:flutter/material.dart';

import '../../../data/models/movie_model.dart';

import 'movie_details_view.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailsPage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MovieDetailsView(movie: movie);
  }
}
