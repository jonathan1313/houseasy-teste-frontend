import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:houseasy_teste_frontend/app/core/helpers/size_extensions.dart';
import 'package:houseasy_teste_frontend/app/core/styles/custom_theme.dart';
import 'package:houseasy_teste_frontend/app/core/utils/show_animated_dialog.dart';
import 'package:houseasy_teste_frontend/app/core/widgets/lottie_animated_icons_widget.dart';
import 'package:lottie/lottie.dart';

import '../../../data/models/movie_model.dart';
import '../../bloc/list_favorite_movies/list_favorite_movies_bloc.dart';

class ListFavoriteMoviesView extends StatelessWidget {
  const ListFavoriteMoviesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context
        .read<ListFavoriteMoviesBloc>()
        .add(const FetchFavoriteMoviesListEvent());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomTheme.color.shade900,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 1,
        title: const Text(
          'Favoritos',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<ListFavoriteMoviesBloc, ListFavoriteMoviesState>(
        builder: (context, state) {
          if (state.status == ListFavoriteMoviesStatus.loading) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset('assets/lottie/loading_icon_animation.json',
                      width: context.percentWidth(0.2)),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'Recuperando sua lista favoritos...',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  )
                ],
              ),
            );
          }

          if (state.status == ListFavoriteMoviesStatus.loaded) {
            List<Movie> movieList = state.movieList ?? [];

            return ListView.builder(
              itemCount: movieList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 5.0),
                  child: Container(
                    width: context.screenWidth,
                    height: context.percentHeight(0.25),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              NetworkImage(movieList[index].getPostImage()),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 4,
                            offset: const Offset(1, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Stack(
                      children: [
                        Container(
                          height: context.percentHeight(0.25),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movieList[index].getReleaseYear(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                ),
                              ),
                              Text(
                                movieList[index].title ?? '',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
