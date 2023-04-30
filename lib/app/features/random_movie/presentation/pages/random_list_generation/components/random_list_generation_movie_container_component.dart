import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import 'package:houseasy_teste_frontend/app/core/helpers/size_extensions.dart';

import '../../../../../../core/configs/api_tmdb_constants.dart';
import '../../../../../../core/styles/custom_theme.dart';
import '../../../../data/models/movie_model.dart';

class RandomListGenerationMovieContainerComponent extends StatelessWidget {
  final Movie movie;

  const RandomListGenerationMovieContainerComponent({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('/movie_details', extra: movie);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Hero(
              tag: movie.title!,
              child: Container(
                width: context.percentWidth(0.7),
                height: context.percentHeight(0.6),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(movie.getPostImage()),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    width: 3.0,
                    color: CustomTheme.color,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: CustomTheme.color.withAlpha(70),
                      blurRadius: 6.0,
                      spreadRadius: 0.0,
                      offset: const Offset(
                        0.0,
                        3.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
              .animate(
                onPlay: (controller) => controller.repeat(),
              )
              .moveY(
                  begin: 3, end: -5, curve: Curves.easeInOut, duration: 1000.ms)
              .then()
              .moveY(begin: -5, end: 3, curve: Curves.easeInOut),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Container(
              width: context.percentWidth(0.6),
              height: 10,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.25),
                borderRadius: const BorderRadius.all(Radius.elliptical(150, 5)),
              ),
            ),
          )
              .animate(
                onPlay: (controller) => controller.repeat(),
              )
              .scaleX(
                  begin: 0.9,
                  end: 1.0,
                  curve: Curves.easeInOut,
                  duration: 1000.ms)
              .then()
              .scaleX(
                begin: 1.0,
                end: 0.9,
                curve: Curves.easeInOut,
              ),
          const SizedBox(height: 15.0),
          SizedBox(
            width: context.percentWidth(0.6),
            height: context.percentHeight(0.1),
            child: Text(
              movie.title ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
