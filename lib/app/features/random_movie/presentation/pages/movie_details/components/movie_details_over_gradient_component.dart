import 'package:flutter/material.dart';
import 'package:houseasy_teste_frontend/app/core/helpers/size_extensions.dart';

class MovieDetailsOverGradientComponent extends StatelessWidget {
  const MovieDetailsOverGradientComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0.0,
      bottom: 0.0,
      width: context.screenWidth,
      height: context.percentHeight(0.7),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(1.0),
              Colors.black.withOpacity(0.0),
            ],
          ),
        ),
      ),
    );
  }
}
