import 'package:flutter/material.dart';

import '../../../../../../core/styles/custom_theme.dart';

class SignUpUseTermsComponent extends StatelessWidget {
  const SignUpUseTermsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Ao realizar o cadastro você concorda com nossos ',
        style: const TextStyle(
          fontSize: 12.0,
          color: Colors.grey,
        ),
        children: [
          TextSpan(
            text: 'Termos e Condições de Uso.',
            style: TextStyle(color: CustomTheme.color.shade900),
          ),
        ],
      ),
    );
  }
}
