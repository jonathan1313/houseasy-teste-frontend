import 'package:flutter/material.dart';

import 'package:houseasy_teste_frontend/app/core/helpers/size_extensions.dart';
import '../../../../core/styles/custom_theme.dart';

class AuthGradientBackgroundWidget extends StatelessWidget {
  const AuthGradientBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      height: context.screenHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            CustomTheme.color.shade900,
            CustomTheme.color,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
    );
  }
}
