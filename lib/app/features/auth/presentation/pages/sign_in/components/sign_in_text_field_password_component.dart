import 'package:flutter/material.dart';

class SignInTextFieldPasswordComponent extends StatelessWidget {
  const SignInTextFieldPasswordComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Senha',
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
