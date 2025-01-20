import 'package:e_commerce/UI/extensions/text_style.dart';
import 'package:e_commerce/UI/utilities/dialogs/show_auth_error.dart';
import 'package:e_commerce/UI/utilities/snackbar.dart';
import 'package:e_commerce/logic/bloc/auth_bloc/auth_bloc.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends HookWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final email = useTextEditingController();
    final displayName = useTextEditingController();
    final password = useTextEditingController();
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, authState) {
        final authError = authState.authError;
        if (authState.isLoading) {
          EasyLoading.show(status: 'Loading...');
        } else {
          if (authError == null) {
            EasyLoading.showSuccess('Register Success');
          }
          EasyLoading.dismiss();
        }
        if (authError != null) {
          showAuthError(authError: authError, context: context);
        }
      },
      builder: (context, authState) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: 'register view'.textHeadline2,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16.0,
              children: [
                TextField(
                  controller: displayName,
                  decoration: InputDecoration(
                    label: const Text('name'),
                    hintText: 'Enter your name',
                  ),
                ),
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
                    backgroundColor: Colors.blue,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      50,
                    ),
                  ),
                  onPressed: () {
                    if (displayName.text != '' &&
                        email.text != '' &&
                        password.text != '') {
                      context.read<AuthBloc>().add(
                            AuthEventRegister(
                              displayName: displayName.text,
                              email: email.text,
                              password: password.text,
                            ),
                          );
                    } else if (displayName.text == '') {
                      snackBar(
                        context: context,
                        text: 'enter your name, please',
                      );
                    } else if (email.text == '') {
                      snackBar(
                        context: context,
                        text: 'enter your email, please',
                      );
                    } else if (password.text == '') {
                      snackBar(
                        context: context,
                        text: 'enter your password, please',
                      );
                    }
                  },
                  child: 'register'.textHeadline2,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      fixedSize: Size(
                        MediaQuery.of(context).size.width,
                        50,
                      ),
                    ),
                    onPressed: () => context.goNamed(Routes.loginView),
                    child: 'Login account'.textHeadline2,
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
