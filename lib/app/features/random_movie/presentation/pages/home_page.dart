import 'package:flutter/material.dart';
import 'package:houseasy_teste_frontend/app/core/helpers/size_extensions.dart';

import '../../../../core/styles/custom_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: context.screenWidth,
          height: context.screenHeight,
          decoration: BoxDecoration(
            color: Colors.blueGrey[100],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: context.screenWidth,
            height: context.percentHeight(0.9),
            padding: const EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              children: [
                
              ],
            ),
          ),
        ),
      ],
    );
  }
}
