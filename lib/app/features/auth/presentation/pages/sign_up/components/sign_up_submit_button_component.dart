import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/custom_gradient_button_widget.dart';
import '../../../bloc/sign_up/sign_up_bloc.dart';

class SignUpSubmitButtonComponent extends StatelessWidget {
  final GlobalKey<FormState> signUpFormKey;
  const SignUpSubmitButtonComponent({
    Key? key,
    required this.signUpFormKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomGradientButtonWidget(
            buttonText: 'Cadastrar-se',
            buttonAction: () {
              if (signUpFormKey.currentState!.validate()) {
                context
                    .read<SignUpBloc>()
                    .add(const SignUpEventSubmitButtonPressedEvent());
              }
            },
          ),
        ),
      ],
    );
  }
}
