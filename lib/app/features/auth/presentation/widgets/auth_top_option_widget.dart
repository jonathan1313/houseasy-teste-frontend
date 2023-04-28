import 'package:flutter/material.dart';

class AuthTopOptionWidget extends StatelessWidget {
  final String labelText;
  final String buttonText;
  final void Function() buttonAction;

  const AuthTopOptionWidget({
    Key? key,
    required this.labelText,
    required this.buttonText,
    required this.buttonAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            labelText,
            style: const TextStyle(fontSize: 12.0, color: Colors.white),
          ),
          const SizedBox(width: 10.0),
          ElevatedButton(
            onPressed: buttonAction,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.grey.withOpacity(0.3),
            ),
            child: Text(
              buttonText,
              style: const TextStyle(
                fontSize: 12.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
