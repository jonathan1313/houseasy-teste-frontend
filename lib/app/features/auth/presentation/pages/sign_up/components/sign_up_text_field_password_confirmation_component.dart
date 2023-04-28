import 'package:flutter/material.dart';

import '../../../../../../core/mixins/input_validations_mixin.dart';

class SignUpTextFieldPasswordConfirmationComponent extends StatelessWidget with InputValidationsMixin {
  SignUpTextFieldPasswordConfirmationComponent({super.key});

  final ValueNotifier<bool> _obscurePassword = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _obscurePassword,
      builder: (_, value, __) {
        return TextFormField(
          obscureText: _obscurePassword.value,
          decoration: InputDecoration(
            labelText: 'Confirme a Senha',
            suffixIcon: IconButton(
              onPressed: () {
                _obscurePassword.value = !_obscurePassword.value;
              },
              icon: _obscurePassword.value
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
            ),
            counterText: '',
          ),
          validator: (textFieldValue) => combine([
            () => isNotEmpty(textFieldValue),
            () => hasMinChars(textFieldValue),
            () => isConfirmationValid(textFieldValue, '123') // change to value of password on bloC state
          ]),
          onChanged: ((textFieldValue){}),
        );
      }
    );
  }
}
