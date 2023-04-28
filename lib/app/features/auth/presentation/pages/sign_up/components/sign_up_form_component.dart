import 'package:flutter/material.dart';

import 'sign_up_text_field_user_name_component.dart';
import 'sign_up_text_field_email_component.dart';
import 'sign_up_text_field_password_component.dart';
import 'sign_up_text_field_password_confirmation_component.dart';
import 'sign_up_use_terms_component.dart';
import 'sign_up_submit_button_component.dart';

class SignUpFormComponent extends StatelessWidget {
  const SignUpFormComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          children: const [
            Text(
              'Cadastre-se agora mesmo',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10.0),
            Text(
              'Preencha as informações abaixo para continuar',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 25.0),
            SignUpTextFieldUserNameComponent(),
            SizedBox(height: 10.0),
            SignUpTextFieldEmailComponent(),
            SizedBox(height: 10.0),
            SignUpTextFieldPasswordComponent(),
            SizedBox(height: 10.0),
            SignUpTextFieldPasswordConfirmationComponent(),
            SizedBox(height: 25.0),
            SignUpUseTermsComponent(),
            SizedBox(height: 10.0),
            SignUpSubmitButtonComponent(),
            SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}
