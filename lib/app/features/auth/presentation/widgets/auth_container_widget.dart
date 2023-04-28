import 'package:flutter/material.dart';
import 'package:houseasy_teste_frontend/app/core/helpers/size_extensions.dart';

class AuthContainerWidget extends StatelessWidget {
  final Widget child;

  const AuthContainerWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: context.percentHeight(0.2),
          alignment: Alignment.center,
          child: const Text(
            'RandoMovie',
            style: TextStyle(
                fontSize: 28.0,
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
        ),
        Container(
          width: context.percentWidth(0.90),
          height: 10.0,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
        ),
        Container(
          width: context.screenWidth,
          height: context.percentHeight(0.7),
          padding: const EdgeInsets.all(20.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: child,
        ),
      ],
    );
  }
}
