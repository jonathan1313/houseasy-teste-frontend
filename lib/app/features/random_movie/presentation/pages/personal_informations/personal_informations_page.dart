import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'personal_informations_view.dart';

class PersonalInformationsPage extends StatelessWidget {

  final User currentUser;

  const PersonalInformationsPage({
    super.key,
    required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    return PersonalInformationsView(currentUser: currentUser);
  }
}
