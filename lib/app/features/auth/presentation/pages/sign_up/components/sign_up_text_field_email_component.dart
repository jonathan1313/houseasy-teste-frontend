import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/mixins/input_validations_mixin.dart';

import '../../../bloc/sign_up/sign_up_bloc.dart';

class SignUpTextFieldEmailComponent extends StatelessWidget
    with InputValidationsMixin {
  const SignUpTextFieldEmailComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'E-mail',
        counterText: '',
      ),
      keyboardType: TextInputType.emailAddress,
      maxLength: 120,
      validator: (textFieldValue) => combine([
        () => isNotEmpty(textFieldValue),
        () => hasMinChars(textFieldValue),
        () => isValidEmail(textFieldValue),
      ]),
      onChanged: (textFieldValue) {
        context.read<SignUpBloc>().add(SignUpEventEmailTextChangedEvent(email: textFieldValue));
      },
    );
  }
}
