import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:houseasy_teste_frontend/app/core/helpers/size_extensions.dart';

class ListFavoriteMoviesLoadingComponent extends StatelessWidget {

  final String message;

  const ListFavoriteMoviesLoadingComponent({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/lottie/loading_icon_animation.json',
              width: context.percentWidth(0.2)),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            message,
            style: const TextStyle(
              fontSize: 14.0,
            ),
          )
        ],
      ),
    );
  }
}
