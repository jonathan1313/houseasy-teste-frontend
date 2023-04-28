import 'package:flutter/material.dart';

import '../../widgets/auth_container_widget.dart';
import '../../widgets/auth_gradient_background_widget.dart';
import '../../widgets/auth_top_option_widget.dart';
import 'components/sign_up_form_component.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                          AuthTopOptionWidget(
                            labelText: 'Já é cadastrado?',
                            buttonText: 'Entrar',
                            buttonAction: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                      AuthContainerWidget(
                        child: SignUpFormComponent(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
