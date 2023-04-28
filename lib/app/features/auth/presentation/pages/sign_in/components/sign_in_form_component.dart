import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/show_animated_dialog.dart';
import '../../../../../../core/widgets/lottie_animated_icons_widget.dart';

import 'sign_in_text_field_email_component.dart';
import 'sign_in_text_field_password_component.dart';
import 'sign_in_submit_button_component.dart';

import '../../../bloc/sign_in/sign_in_bloc.dart';

class SignInFormComponent extends StatelessWidget {
  SignInFormComponent({super.key});

  final GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state.status == SignInStatus.failure) {
            ShowAnimatedDialog.show(
              context: context,
              dialogBody: Text(state.message, textAlign: TextAlign.center),
              alertType: AnimatedIconsTypes.failure,
              actions: [
                TextButton(
                  onPressed: () {
                    context.pop();
                    context
                        .read<SignInBloc>()
                        .add(const SignInSetInitialStateEvent());
                  },
                  child: const Text('Tentar Novamente'),
                ),
              ],
            );
          }

          if (state.status == SignInStatus.success) {
            context.read<SignInBloc>().add(const SignInSetInitialStateEvent());
            context.pushReplacement('/home');
          }
        },
        child: Form(
          key: _signInFormKey,
          child: Column(
            children: [
              const Text(
                'Bem Vindo Novamente',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Informe seus detalhes para login abaixo',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 25.0),
              const SignInTextFieldEmailComponent(),
              const SizedBox(height: 10.0),
              SignInTextFieldPasswordComponent(),
              const SizedBox(height: 25.0),
              SignInSubmitButtonComponent(signInFormKey: _signInFormKey),
              const SizedBox(height: 25.0),
              const Text(
                'Esqueceu sua senha?',
                style: TextStyle(fontSize: 12.0, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
