import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/auth_container_widget.dart';
import '../../widgets/auth_gradient_background_widget.dart';
import '../../widgets/auth_top_option_widget.dart';

import 'components/sign_in_form_component.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                const AuthGradientBackgroundWidget(),
                SafeArea(
                  child: Column(
                    children: [
                      AuthTopOptionWidget(
                        labelText: 'Não possui uma conta?',
                        buttonText: 'Crie Agora',
                        buttonAction: () =>
                            context.push('/sign_up'),
                      ),
                      AuthContainerWidget(
                        child: SignInFormComponent(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
