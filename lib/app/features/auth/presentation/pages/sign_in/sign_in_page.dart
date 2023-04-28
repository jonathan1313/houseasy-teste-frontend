import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../bloc/sign_in/sign_in_bloc.dart';

import '../../../data/repositories/sign_in_repository_impl.dart';
import '../../../domain/usecases/sign_in/sign_in_usecase.dart';
import '../../../domain/usecases/sign_in/sign_in_usecase_impl.dart';

import 'sign_in_view.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final SignInUsecase _signInUsecase =
      SignInUsecaseImpl(SignInRepositoryImpl(FirebaseAuth.instance));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(signInUsecase: _signInUsecase),
      child: const SignInView(),
    );
  }
}
