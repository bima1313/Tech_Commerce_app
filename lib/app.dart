import 'package:e_commerce/data/api/firebase/auth/auth_service.dart';
import 'package:e_commerce/logic/bloc/auth_bloc/auth_bloc.dart';
import 'package:e_commerce/logic/bloc/main_bloc/main_bloc.dart';
import 'package:e_commerce/logic/bloc/order_bloc/order_bloc.dart';
import 'package:e_commerce/logic/cubit/clikable/clickable_cubit.dart';
import 'package:e_commerce/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart' show EasyLoading;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthBloc(CloudAuth())..add(const AuthEventInitialize()),
        ),
        BlocProvider(
          create: (context) => MainBloc(),
        ),
        BlocProvider(
          create: (context) => OrderBloc(),
        ),
        BlocProvider(
          create: (context) => ClickableCubit(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Tech Commerce',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blueAccent,
            surface: const Color.fromARGB(255, 228, 226, 226),
            primary: Colors.blueAccent,
          ),
          useMaterial3: true,
        ),
        builder: EasyLoading.init(),
        routerConfig: router,
      ),
    );
  }
}
