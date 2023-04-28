import 'package:flutter/material.dart';

class SignInLoadingComponent extends StatelessWidget {
  const SignInLoadingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CircularProgressIndicator(),
        SizedBox(
          height: 10.0,
        ),
        Text(
          'Validando informacões...',
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
