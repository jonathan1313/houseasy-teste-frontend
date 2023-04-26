import 'package:flutter/material.dart';

import 'features/auth/presentation/pages/sign_in/sign_in_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Houseasy FrontEnd Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const SignInPage(),
    );
  }
}