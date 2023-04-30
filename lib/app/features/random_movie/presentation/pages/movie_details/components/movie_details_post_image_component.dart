import 'package:flutter/material.dart';
import 'package:houseasy_teste_frontend/app/core/helpers/size_extensions.dart';

import '../../../../../../core/configs/api_tmdb_constants.dart';

class MovieDetailsPostImageComponent extends StatelessWidget {
  final String heroTag;
  final String posterPath;

  const MovieDetailsPostImageComponent({
    Key? key,
    required this.heroTag,
    required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: SizedBox(
        width: context.screenWidth,
        height: context.screenHeight,
        child: Image.network(
          fit: BoxFit.cover,
          posterPath,
        ),
      ),
    );
  }
}
