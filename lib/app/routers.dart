import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:houseasy_teste_frontend/app/features/random_movie/data/models/movie_model.dart';

import 'features/auth/data/repositories/current_user_repository_impl.dart';
import 'features/auth/domain/usecases/current_user/current_user_usecase.dart';
import 'features/auth/domain/usecases/current_user/current_user_usecase_impl.dart';

import 'features/auth/presentation/pages/sign_in/sign_in_page.dart';
import 'features/auth/presentation/pages/sign_up/sign_up_page.dart';
import 'features/random_movie/presentation/pages/home/home_page.dart';
import 'features/random_movie/presentation/pages/list_favorite_movies/list_favorite_movies_page.dart';
import 'features/random_movie/presentation/pages/movie_details/movie_details_page.dart';
import 'features/random_movie/presentation/pages/personal_informations/personal_informations_page.dart';
import 'features/random_movie/presentation/pages/random_list_generation/random_list_generation_page.dart';

final CurrentUserUsecase _currentUserUsecase =
    CurrentUserUsecaseImpl(CurrentUserRepositoryImpl(FirebaseAuth.instance));

final GoRouter routes = GoRouter(
  initialLocation: _currentUserUsecase.getCurrentUser == null ? '/' : '/home',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SignInPage(),
      redirect: (context, state) =>
          _currentUserUsecase.getCurrentUser == null ? '/' : '/home',
    ),
    GoRoute(
      path: '/sign_up',
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
      redirect: (context, state) =>
          _currentUserUsecase.getCurrentUser == null ? '/' : '/home',
    ),
    GoRoute(
      path: '/random_list',
      builder: (context, state) => RandomListGenerationPage(),
    ),
    GoRoute(
      path: '/movie_details',
      name: 'movie_details',
      builder: (context, state) {
        return MovieDetailsPage(movie: state.extra as Movie);
      },
    ),
    GoRoute(
      path: '/favorite_movies',
      builder: (context, state) {
        return ListFavoriteMoviesPage();
      },
    ),
    GoRoute(
      path: '/personal_informations',
      name: 'personal_informations',
      builder: (context, state) {
        return PersonalInformationsPage(currentUser: state.extra as User);
      },
    ),
  ],
);
