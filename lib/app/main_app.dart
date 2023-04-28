import 'package:flutter/material.dart';
import 'package:houseasy_teste_frontend/app/routers.dart';

import 'core/styles/custom_theme.dart';
import 'core/utils/dismiss_keyboard_widget.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DismissKeyboardWidget(
      child: MaterialApp(
        title: 'Houseasy FrontEnd Test',
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.theme,
        routes: Routers.pages,
      ),
    );
  }
}
