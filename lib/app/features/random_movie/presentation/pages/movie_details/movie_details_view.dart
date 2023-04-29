import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:houseasy_teste_frontend/app/core/helpers/size_extensions.dart';
import 'package:houseasy_teste_frontend/app/core/styles/custom_theme.dart';

import '../../../../../core/configs/api_tmdb_constants.dart';
import '../../../data/models/movie_model.dart';

class MovieDetailsView extends StatelessWidget {
  final Movie movie;

  const MovieDetailsView({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.color.shade900,
      body: Stack(
        children: [
          Hero(
            tag: movie.title!,
            child: SizedBox(
              width: context.screenWidth,
              height: context.screenHeight,
              child: Image.network(
                fit: BoxFit.cover,
                ApiTmdbConstants.requestImg(
                  movie.posterPath ??
                      'https://www.charlotteathleticclub.com/assets/camaleon_cms/image-not-found-4a963b95bf081c3ea02923dceaeb3f8085e1a654fc54840aac61a57a60903fef.png',
                ),
              ),
            ),
          ),
          Positioned(
              left: 0.0,
              bottom: 0.0,
              width: context.screenWidth,
              height: context.percentHeight(0.4),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(1),
                      Colors.black.withOpacity(0),
                    ],
                  ),
                ),
              ),
            ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            child: Container(
              width: context.screenWidth,
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.getReleaseYear(),
                    style: const TextStyle(color: Colors.white, fontSize: 14.0),
                  ),
                  Text(
                    movie.title ?? '',
                    softWrap: true,
                    style: const TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 25.0,
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
                  IconButton(
                    icon: const Icon(
                      Icons.star_outline,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: () => context.pop(),
                  ),
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
