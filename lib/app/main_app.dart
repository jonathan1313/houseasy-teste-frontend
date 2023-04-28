import 'package:flutter/material.dart';

import 'core/styles/custom_theme.dart';
import 'core/utils/dismiss_keyboard_widget.dart';

import 'routers.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DismissKeyboardWidget(
      child: MaterialApp.router(
        title: 'Houseasy FrontEnd Test',
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.theme,
        routerConfig: routes,       
      ),
    );
  }
}
