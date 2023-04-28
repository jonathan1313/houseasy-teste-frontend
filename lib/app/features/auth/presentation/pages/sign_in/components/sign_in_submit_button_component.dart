import 'package:flutter/material.dart';

import '../../../../../../core/widgets/custom_gradient_button_widget.dart';

class SignInSubmitButtonComponent extends StatelessWidget {
  final GlobalKey<FormState> signInFormKey;
  const SignInSubmitButtonComponent({
    Key? key,
    required this.signInFormKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomGradientButtonWidget(
            buttonText: 'Entrar',
            buttonAction: () {
              if (signInFormKey.currentState!.validate()) {
                // alguma coisa
              }
            },
          ),
        ),
      ],
    );
  }
}
