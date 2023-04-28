import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/mixins/input_validations_mixin.dart';

import '../../../bloc/sign_up/sign_up_bloc.dart';

class SignUpTextFieldPasswordConfirmationComponent extends StatelessWidget
    with InputValidationsMixin {
  SignUpTextFieldPasswordConfirmationComponent({super.key});

  final ValueNotifier<bool> _obscurePassword = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _obscurePassword,
        builder: (_, value, __) {
          return BlocBuilder<SignUpBloc, SignUpState>(
            builder: (context, state) {
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
                  () => isConfirmationValid(textFieldValue, state.password),
                ]),
                onChanged: ((textFieldValue) {
                  context.read<SignUpBloc>().add(
                      SignUpEventPasswordConfirmationTextChangedEvent(
                          passwordConfirmation: textFieldValue));
                }),
              );
            },
          );
        });
  }
}
