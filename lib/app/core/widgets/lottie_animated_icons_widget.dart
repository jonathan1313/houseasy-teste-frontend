import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum AnimatedIconsTypes {
  loading,
  success,
  failure,
  info,
}

class LottieAnimatedIconsWidget extends StatelessWidget {
  final AnimatedIconsTypes alertType;
  final bool? repeat;

  const LottieAnimatedIconsWidget({
    Key? key,
    required this.alertType,
    this.repeat = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.0,
      height: 120.0,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Lottie.asset(
          alertType == AnimatedIconsTypes.success
              ? 'assets/lottie/success_icon_animation.json'
              : alertType == AnimatedIconsTypes.failure
                  ? 'assets/lottie/error_icon_animation.json'
                  : alertType == AnimatedIconsTypes.info
                      ? 'assets/lottie/info_icon_animation.json'
                      : 'assets/lottie/loading_icon_animation.json',
          fit: BoxFit.contain,
          repeat: repeat,
        ),
      ),
    );
  }
}
