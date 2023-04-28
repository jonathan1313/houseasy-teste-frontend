import 'package:flutter/material.dart';

import '../../../../../../core/mixins/input_validations_mixin.dart';

class SignInTextFieldEmailComponent extends StatelessWidget with InputValidationsMixin {
  const SignInTextFieldEmailComponent({super.key});

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
      onChanged: ((textFieldValue) {}),
    );
  }
}
