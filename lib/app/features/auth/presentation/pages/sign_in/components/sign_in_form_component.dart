import 'package:flutter/material.dart';

import 'sign_in_text_field_email_component.dart';
import 'sign_in_text_field_password_component.dart';
import 'sign_in_submit_button_component.dart';

class SignInFormComponent extends StatelessWidget {
  SignInFormComponent({super.key});

  final GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signInFormKey,
      child: Column(
        children: [
          const Text(
            'Bem Vindo Novamente',
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10.0),
          const Text(
            'Informe seus detalhes para login abaixo',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 25.0),
          const SignInTextFieldEmailComponent(),
          const SizedBox(height: 10.0),
          SignInTextFieldPasswordComponent(),
          const SizedBox(height: 25.0),
          SignInSubmitButtonComponent(signInFormKey: _signInFormKey),
          const SizedBox(height: 25.0),
          const Text(
            'Esqueceu sua senha?',
            style: TextStyle(fontSize: 12.0, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
