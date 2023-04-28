import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../data/repositories/sign_up_repository_impl.dart';
import '../../../domain/usecases/sign_up/sign_up_usecase.dart';
import '../../../domain/usecases/sign_up/sign_up_usecase_impl.dart';

import '../../bloc/sign_up/sign_up_bloc.dart';

import 'sign_up_view.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final SignUpUsecase _signUpUsecase =
      SignUpUsecaseImpl(SignUpRepositoryImpl(FirebaseAuth.instance));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(signUpUsecase: _signUpUsecase),
      child: const SignUpView(),
    );
  }
}
