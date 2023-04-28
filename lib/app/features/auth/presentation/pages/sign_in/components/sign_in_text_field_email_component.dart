import 'package:flutter/material.dart';

class SignInTextFieldEmailComponent extends StatelessWidget {
  const SignInTextFieldEmailComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'E-mail',
        counterText: '',
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {},
    );
  }
}
