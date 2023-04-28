// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../../core/widgets/custom_gradient_button_widget.dart';

class SignUpSubmitButtonComponent extends StatelessWidget {
  final GlobalKey<FormState> signUpFormKey;
  const SignUpSubmitButtonComponent({
    Key? key,
    required this.signUpFormKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomGradientButtonWidget(
            buttonText: 'Cadastrar-se',
            buttonAction: () {
              if (signUpFormKey.currentState!.validate()) {
                // do something
              }
            },
          ),
        ),
      ],
    );
  }
}
