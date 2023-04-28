import 'package:flutter/material.dart';

class SignUpTextFieldPasswordComponent extends StatelessWidget {
  const SignUpTextFieldPasswordComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
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
