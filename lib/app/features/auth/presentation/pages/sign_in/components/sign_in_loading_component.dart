import 'package:flutter/material.dart';
import 'package:houseasy_teste_frontend/app/core/helpers/size_extensions.dart';
import 'package:lottie/lottie.dart';

class SignInLoadingComponent extends StatelessWidget {
  const SignInLoadingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset('assets/lottie/loading_icon_animation.json', width: context.percentWidth(0.15)),
        const SizedBox(
          height: 10.0,
        ),
        const Text(
          'Validando informacões...',
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
