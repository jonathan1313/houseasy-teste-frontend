import 'package:flutter/material.dart';

class SignUpTextFieldUserNameComponent extends StatelessWidget {
  const SignUpTextFieldUserNameComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Nome',
        counterText: '',
      ),
      onChanged: (value) {},
    );
  }
}
