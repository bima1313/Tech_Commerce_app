import 'package:e_commerce/UI/extensions/text_style.dart';
import 'package:e_commerce/UI/utilities/dialogs/show_auth_error.dart';
import 'package:e_commerce/UI/utilities/snackbar.dart';
import 'package:e_commerce/UI/widgets/image_profile_widget.dart';
import 'package:e_commerce/logic/bloc/auth_bloc/auth_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class EditProfileView extends HookWidget {
  final User? user;
  const EditProfileView({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final address = context.watch<AuthBloc>().state.profile;
    final String userEmail = user?.email ?? '';
    final String displayName = user?.displayName ?? '';
    final nameController = useTextEditingController(text: displayName);
    final emailController = useTextEditingController(text: userEmail);
    final addressController = useTextEditingController(text: address ?? '');
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, authState) {
        final authError = authState.authError;
        if (authState.isLoading) {
          EasyLoading.show(status: 'Loading...');
        } else {
          if (authError == null) {
            EasyLoading.showSuccess('Edit Profile Success');
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
            title: 'Edit Profile'.textHeadline2,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 8.0,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 32.0),
                    child: ImageProfileWidget(isEdit: true),
                  ),
                  Column(
                    spacing: 24.0,
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          label: const Text('Full Name'),
                          hintText: 'Input your Full Name',
                        ),
                      ),
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          label: const Text('Email'),
                          hintText: 'Input your Email',
                        ),
                      ),
                      TextField(
                        controller: addressController,
                        decoration: InputDecoration(
                          label: const Text('Address'),
                          hintText: 'Input your Address',
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          fixedSize:
                              Size(MediaQuery.of(context).size.width, 50),
                        ),
                        onPressed: () {
                          if (nameController.text != '' &&
                              emailController.text != '' &&
                              addressController.text != '') {
                            context.read<AuthBloc>().add(
                                  AuthEventEditProfile(
                                    newName: nameController.text,
                                    newEmail: emailController.text,
                                    newAddress: addressController.text,
                                  ),
                                );
                          } else {
                            snackBar(
                              context: context,
                              text: 'Edit Profile failed',
                            );
                          }
                        },
                        child: 'Edit Profile'.textHeadline2,
                      ),
                    ],
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
