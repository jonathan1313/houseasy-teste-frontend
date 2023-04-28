import 'package:flutter/material.dart';

import '../styles/custom_theme.dart';

class CustomGradientButtonWidget extends StatelessWidget {
  final String buttonText;
  final void Function() buttonAction;

  const CustomGradientButtonWidget({
    Key? key,
    required this.buttonText,
    required this.buttonAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonAction,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0.0),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              CustomTheme.color.shade900,
              CustomTheme.color,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 50.0,
          ),
          alignment: Alignment.center,
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
        ),
      ),
    );
  }
}
