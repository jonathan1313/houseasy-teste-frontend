import 'package:flutter/material.dart';

import '../widgets/lottie_animated_icons_widget.dart';

class ShowAnimatedDialog {
  void show({
    required BuildContext context,
    required Widget dialogBody,
    List<Widget>? actions,
    AnimatedIconsTypes? alertType,
    bool isDismissible = false,
    bool repeatIconAnimation = true,
  }) {
    showGeneralDialog(
      context: context,
      barrierLabel: '',
      barrierDismissible: isDismissible,
      pageBuilder: (ctx, animation, secondaryAnimation) => Container(),
      transitionBuilder: (ctx, animation, secondaryAnimation, child) {
        var curve = Curves.easeInOut.transform(animation.value);
        return Transform.scale(
          scale: curve,
          child: AlertDialog(
            icon: alertType != null
                ? LottieAnimatedIconsWidget(
                    alertType: alertType,
                    repeat: repeatIconAnimation,
                  )
                : null,
            scrollable: true,
            content: dialogBody,
            actions: actions,
          ),
        );
      },
    );
  }
}
