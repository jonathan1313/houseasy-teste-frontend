import 'package:flutter/material.dart';

import '../../../../../../core/widgets/custom_gradient_button_widget.dart';

class SignUpSubmitButtonComponent extends StatelessWidget {
  const SignUpSubmitButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomGradientButtonWidget(
            buttonText: 'Cadastrar-se',
            buttonAction: () {},
          ),
        ),
      ],
    );
  }
}
