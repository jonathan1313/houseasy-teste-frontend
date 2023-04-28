import 'package:flutter/material.dart';
import 'package:houseasy_teste_frontend/app/core/mixins/input_validations_mixin.dart';

class SignInTextFieldPasswordComponent extends StatelessWidget
    with InputValidationsMixin {
  SignInTextFieldPasswordComponent({super.key});

  final ValueNotifier<bool> _obscurePassword = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: _obscurePassword,
        builder: (_, value, __) {
          return TextFormField(
            obscureText: _obscurePassword.value,
            decoration: InputDecoration(
              labelText: 'Senha',
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
            maxLength: 30,
            validator: (textFieldValue) => combine(
              [
                () => isNotEmpty(textFieldValue),
                () => hasMinChars(textFieldValue),
              ],
            ),
            onChanged: ((textFieldValue) {}),
          );
        });
  }
}
