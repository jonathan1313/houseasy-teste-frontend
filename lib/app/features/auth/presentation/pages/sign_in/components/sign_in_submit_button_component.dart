import 'package:flutter/material.dart';

import '../../../../../../core/widgets/custom_gradient_button_widget.dart';

class SignInSubmitButtonComponent extends StatelessWidget {
  const SignInSubmitButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomGradientButtonWidget(
            buttonText: 'Entrar',
            buttonAction: () {},
          ),
        ),
      ],
    );
  }
}
