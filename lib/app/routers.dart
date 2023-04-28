import 'package:flutter/material.dart';

import 'features/auth/presentation/pages/sign_in/sign_in_page.dart';
import 'features/auth/presentation/pages/sign_up/sign_up_page.dart';

class Routers {
  Routers._();

  static Map<String, Widget Function(BuildContext)> get pages => {
        '/': (context) => SignInPage(),
        '/signUp': (context) => SignUpPage(),
      };
}
