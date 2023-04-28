import 'package:flutter/material.dart';

import 'sign_in_text_field_email_component.dart';
import 'sign_in_text_field_password_component.dart';
import 'sign_in_submit_button_component.dart';

class SignInFormComponent extends StatelessWidget {
  const SignInFormComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: const [
          Text(
            'Bem Vindo Novamente',
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 10.0),
          Text(
            'Informe seus detalhes para login abaixo',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 25.0),
          SignInTextFieldEmailComponent(),
          SizedBox(height: 10.0),
          SignInTextFieldPasswordComponent(),
          SizedBox(height: 25.0),
          SignInSubmitButtonComponent(),
          SizedBox(height: 25.0),
          Text(
            'Esqueceu sua senha?',
            style: TextStyle(fontSize: 12.0, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
