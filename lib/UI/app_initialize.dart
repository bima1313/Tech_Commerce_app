import 'package:e_commerce/UI/views/home_view.dart';
import 'package:e_commerce/UI/views/login_view.dart';
import 'package:e_commerce/logic/bloc/auth_bloc/auth_bloc.dart';
import 'package:e_commerce/logic/bloc/main_bloc/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocConsumer, ReadContext;

class AppInitialize extends StatelessWidget {
  const AppInitialize({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, authState) {
        if (authState is AuthStateLoggedIn) {
          context.read<MainBloc>().add(const MainEventInitialize());
        }
      },
      builder: (context, authState) {
        if (authState is AuthStateLoggedOut) {
          return const LoginView();
        } else if (authState is AuthStateLoggedIn) {
          return const HomeView();
        } else {
          return Container();
        }
      },
    );
  }
}
