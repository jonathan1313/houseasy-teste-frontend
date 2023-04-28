import 'package:flutter/material.dart';

class SignUpTextFieldPasswordConfirmationComponent extends StatelessWidget {
  const SignUpTextFieldPasswordConfirmationComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Confirme a Senha',
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.visibility),
        ),
        counterText: '',
      ),
      onChanged: (value) {},
    );
  }
}
