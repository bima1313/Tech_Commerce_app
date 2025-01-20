import 'package:e_commerce/UI/extensions/text_style.dart';
import 'package:e_commerce/UI/widgets/custom_elevated_button.dart';
import 'package:e_commerce/data/constants/profile_page_menu.dart';
import 'package:e_commerce/logic/bloc/auth_bloc/auth_bloc.dart';
import 'package:e_commerce/logic/bloc/main_bloc/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<MainBloc>().state.user;
    final String loadUser = 'Loading...';
    final String displayName = user?.displayName ?? loadUser;
    final String email = user?.email ?? '';

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, authState) {
        if (authState.isLoading) {
          EasyLoading.show(status: loadUser);
        } else {
          EasyLoading.dismiss();
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: 'Profile'.textHeadline2,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 8.0,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 64.0,
                      ),
                    ),
                  ),
                  displayName.textHeadline2,
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: email.textHeadline2,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    prototypeItem: const Padding(
                      padding: EdgeInsets.only(bottom: 24.0),
                      child: CustomElevatedButton(
                        icon: Icons.account_circle,
                        text: '',
                      ),
                    ),
                    itemCount: menusButton.length,
                    itemBuilder: (context, index) {
                      final menuButton = menusButton.elementAt(index);
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: CustomElevatedButton(
                          icon: menuButton[0],
                          text: menuButton[1],
                          user: user,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
