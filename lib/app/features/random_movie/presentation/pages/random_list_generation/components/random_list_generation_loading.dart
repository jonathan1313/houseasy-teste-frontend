import 'package:flutter/material.dart';
import 'package:houseasy_teste_frontend/app/core/helpers/size_extensions.dart';
import 'package:lottie/lottie.dart';

class RandomListGenerationLoading extends StatelessWidget {
  const RandomListGenerationLoading({super.key});

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
          const Text(
            'Escolhendo alguns filmes...',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
