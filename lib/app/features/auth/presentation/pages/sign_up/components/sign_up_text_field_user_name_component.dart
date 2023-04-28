import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/mixins/input_validations_mixin.dart';

import '../../../bloc/sign_up/sign_up_bloc.dart';

class SignUpTextFieldUserNameComponent extends StatelessWidget
    with InputValidationsMixin {
  const SignUpTextFieldUserNameComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Nome',
        counterText: '',
      ),
      maxLength: 100,
      validator: (textFieldValue) => combine([
        () => isNotEmpty(textFieldValue),
        () => hasMinChars(textFieldValue),
      ]),
      onChanged: ((textFieldValue) {
        context
            .read<SignUpBloc>()
            .add(SignUpEventUserNameTextChangedEvent(userName: textFieldValue));
      }),
    );
  }
}
