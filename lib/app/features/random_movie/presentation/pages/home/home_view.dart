import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:houseasy_teste_frontend/app/core/helpers/size_extensions.dart';

import '../../../../auth/presentation/pages/sign_out/sign_out_page.dart';
import '../../widgets/random_movie_list_tile_item_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late final User currentUser;

  @override
  void initState() {
    currentUser = _firebaseAuth.currentUser!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: context.screenWidth,
              height: context.percentHeight(0.9),
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: context.percentWidth(0.15),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    currentUser.displayName ?? '',
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: context.percentHeight(0.5),
                    child: ListView(
                      children: [
                        RandomMovieListTileItemWidget(
                          title: 'Me Surpreenda',
                          subtitle: 'Indicação de 5 filmes aleatórios',
                          leadingIcon: Icons.movie_outlined,
                          tileAction: () => context.push('/random_list'),
                        ),
                        RandomMovieListTileItemWidget(
                          title: 'Meus Favoritos',
                          subtitle: 'Filmes salvos como favoritos',
                          leadingIcon: Icons.star_outline,
                          tileAction: () => context.push('/favorite_movies'),
                        ),
                        RandomMovieListTileItemWidget(
                          title: 'Informações Pessoais',
                          subtitle: 'Detalhes sobre sua conta',
                          leadingIcon: Icons.person_outline,
                          tileAction: () {},
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SignOutPage(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
