import 'package:e_commerce/UI/extensions/text_style.dart';
import 'package:e_commerce/UI/utilities/dialogs/show_auth_error.dart';
import 'package:e_commerce/logic/bloc/main_bloc/main_bloc.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/logic/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class LoginView extends HookWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final email = useTextEditingController();
    final password = useTextEditingController();
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, authState) {
        final authError = authState.authError;
        if (authState.isLoading) {
          EasyLoading.show(status: 'Loading...');
        } else {
          EasyLoading.dismiss();
        }
        if (authState is AuthStateLoggedIn) {
          context.read<MainBloc>().add(const MainEventInitialize());
          context.goNamed(Routes.homeView);
        }
        if (authError != null) {
          showAuthError(authError: authError, context: context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: 'Login View'.textHeadline2,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16.0,
              children: [
                TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    label: const Text('email'),
                    hintText: 'Enter your email',
                  ),
                ),
                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    label: const Text('password'),
                    hintText: 'Enter your password',
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      50,
                    ),
                  ),
                  onPressed: () {
                    context.read<AuthBloc>().add(
                          AuthEventLogIn(
                            email: email.text,
                            password: password.text,
                          ),
                        );
                  },
                  child: 'Login'.textHeadline2,
                ),
                TextButton(
                  onPressed: () => context.pushNamed(Routes.resetPasswordView),
                  child: 'Forgot password?'.textButton,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      fixedSize: Size(
                        MediaQuery.of(context).size.width,
                        50,
                      ),
                    ),
                    onPressed: () => context.goNamed(Routes.registerView),
                    child: 'Create new account'.textHeadline2,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
