import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:houseasy_teste_frontend/app/core/helpers/size_extensions.dart';

import '../../../../data/models/movie_model.dart';

class ListFavoriteMoviesMovieCardComponent extends StatelessWidget {
  final Movie movie;

  const ListFavoriteMoviesMovieCardComponent({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: Container(
        width: context.screenWidth,
        height: context.percentHeight(0.25),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(movie.getPostImage()),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 4,
                offset: const Offset(1, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(10.0)),
        child: Stack(
          children: [
            Container(
              height: context.percentHeight(0.25),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.getReleaseYear(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    movie.title ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ).animate().fadeIn();
  }
}
