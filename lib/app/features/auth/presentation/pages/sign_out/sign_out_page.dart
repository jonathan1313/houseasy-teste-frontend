import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/sign_out_repository_impl.dart';
import '../../../domain/usecases/sign_out/sign_out_usecase.dart';
import '../../../domain/usecases/sign_out/sign_out_usecase_impl.dart';

import '../../bloc/sign_out/sign_out_bloc.dart';

import 'sign_out_view.dart';

class SignOutPage extends StatelessWidget {
  SignOutPage({super.key});

  final SignOutUsecase _signOutUsecase =
      SignOutUsecaseImpl(SignOutRepositoryImpl(FirebaseAuth.instance));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignOutBloc(signOutUsecase: _signOutUsecase),
      child: const SignOutView(),
    );
  }
}
