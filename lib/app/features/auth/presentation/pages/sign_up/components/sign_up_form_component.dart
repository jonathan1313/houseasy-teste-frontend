import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/sign_up/sign_up_bloc.dart';

import 'sign_up_text_field_user_name_component.dart';
import 'sign_up_text_field_email_component.dart';
import 'sign_up_text_field_password_component.dart';
import 'sign_up_text_field_password_confirmation_component.dart';
import 'sign_up_use_terms_component.dart';
import 'sign_up_submit_button_component.dart';

class SignUpFormComponent extends StatelessWidget {
  SignUpFormComponent({super.key});

  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          
          // active loading and success menssage
          
        },
        child: Form(
          key: _signUpFormKey,
          child: Column(
            children: [
              const Text(
                'Cadastre-se agora mesmo',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Preencha as informações abaixo para continuar',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 25.0),
              const SignUpTextFieldUserNameComponent(),
              const SizedBox(height: 10.0),
              const SignUpTextFieldEmailComponent(),
              const SizedBox(height: 10.0),
              SignUpTextFieldPasswordComponent(),
              const SizedBox(height: 10.0),
              SignUpTextFieldPasswordConfirmationComponent(),
              const SizedBox(height: 25.0),
              const SignUpUseTermsComponent(),
              const SizedBox(height: 25.0),
              SignUpSubmitButtonComponent(signUpFormKey: _signUpFormKey),
              const SizedBox(height: 15.0),
            ],
          ),
        ),
      ),
    );
  }
}
