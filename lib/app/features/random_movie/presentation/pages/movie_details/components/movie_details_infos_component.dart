import 'package:flutter/material.dart';

import 'package:houseasy_teste_frontend/app/core/helpers/size_extensions.dart';

class MovieDetailsInfosComponent extends StatelessWidget {
  final String releaseYear;
  final String voteAverage;
  final String title;
  final String overview;

  const MovieDetailsInfosComponent({
    super.key,
    required this.releaseYear,
    required this.voteAverage,
    required this.title,
    required this.overview,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.0,
      left: 0.0,
      child: Container(
        width: context.screenWidth,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ano: $releaseYear | Nota: $voteAverage',
              style: const TextStyle(color: Colors.white, fontSize: 14.0),
            ),
            Text(
              title,
              softWrap: true,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              overview,
              softWrap: true,
              style: const TextStyle(color: Colors.white, fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }
}
