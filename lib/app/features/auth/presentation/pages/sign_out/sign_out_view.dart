import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/styles/custom_theme.dart';
import '../../../../../core/utils/show_animated_dialog.dart';
import '../../../../../core/widgets/lottie_animated_icons_widget.dart';

import '../../bloc/sign_out/sign_out_bloc.dart';

class SignOutView extends StatelessWidget {
  const SignOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignOutBloc, SignOutState>(
      listener: (context, state) {
        if (state.status == SignOutStatus.success) {
          Navigator.pushReplacementNamed(context, '/');
        }
      },
      child: OutlinedButton(
        onPressed: () {
          ShowAnimatedDialog.show(
            context: context,
            dialogBody: const Text(
              'Tem certeza que deseja sair?',
              textAlign: TextAlign.center,
            ),
            alertType: AnimatedIconsTypes.info,
            repeatIconAnimation: false,
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Continuar',
                  style: TextStyle(
                    color: CustomTheme.color.shade900,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => context
                    .read<SignOutBloc>()
                    .add(const SignOutOnButtonPressedEvent()),
                child: const Text('Sair'),
              ),
            ],
          );
        },
        child: const Text('Sair'),
      ),
    );
  }
}
