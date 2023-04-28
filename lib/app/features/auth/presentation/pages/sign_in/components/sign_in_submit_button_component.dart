import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/custom_gradient_button_widget.dart';

import '../../../bloc/sign_in/sign_in_bloc.dart';
import 'sign_in_loading_component.dart';

class SignInSubmitButtonComponent extends StatelessWidget {
  final GlobalKey<FormState> signInFormKey;
  const SignInSubmitButtonComponent({
    Key? key,
    required this.signInFormKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) {

            if (state.status == SignInStatus.loading) return const SignInLoadingComponent();
            
            return Expanded(
              child: CustomGradientButtonWidget(
                buttonText: 'Entrar',
                buttonAction: () {
                  if (signInFormKey.currentState!.validate()) {
                    context
                        .read<SignInBloc>()
                        .add(const SignInSubmmitButtonPressedEvent());
                  }
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
