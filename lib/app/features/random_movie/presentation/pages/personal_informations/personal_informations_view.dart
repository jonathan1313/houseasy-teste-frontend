import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:houseasy_teste_frontend/app/core/helpers/size_extensions.dart';
import '../../../../../core/styles/custom_theme.dart';

class PersonalInformationsView extends StatelessWidget {
  final User currentUser;

  const PersonalInformationsView({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações Pessoais'),
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: CustomTheme.color.shade900,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: context.percentWidth(0.15),
              backgroundImage: const AssetImage('assets/images/profile_example.png'),
            ),
            const SizedBox(height: 10.0),
            Text(
              currentUser.displayName ?? '',
              style: const TextStyle(
                  fontSize: 18.0, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: const [
                    Text('35', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),),
                    Text('Descobertos'),
                  ],
                ),
                Column(
                  children: const [
                    Text('5', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),),
                    Text('Favoritos'),
                  ],
                ),
                Column(
                  children: const [
                    Text('2', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),),
                    Text('Assitidos'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              height: context.percentHeight(0.4),
              child: ListView(
                children: [
                  ListTile(
                    title: const Text('Email'),
                    subtitle: Text(currentUser.email ?? '', style: const TextStyle(fontSize: 12.0),),
                    leading: const Icon(Icons.alternate_email),
                    trailing: const Icon(Icons.edit_outlined),
                  ),
                  const ListTile(
                    title: Text('Notificações'),
                    subtitle: Text('Notificações desativadas', style: TextStyle(fontSize: 12.0),),
                    leading: Icon(Icons.notifications_outlined),
                    trailing: Icon(Icons.edit_outlined),
                  ),
                  const ListTile(
                    title: Text('Excluir conta'),
                    subtitle: Text('Remover meus dados', style: TextStyle(fontSize: 12.0),),
                    leading: Icon(Icons.delete_outlined),
                    trailing: Icon(Icons.edit_outlined),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
