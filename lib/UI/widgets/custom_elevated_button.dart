import 'package:e_commerce/UI/extensions/text_style.dart';
import 'package:e_commerce/routes/parameters.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/logic/bloc/auth_bloc/auth_bloc.dart';
import 'package:e_commerce/data/models/products.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.icon,
    required this.text,
    this.user,
    this.products,
    this.isCategoryButton = false,
  });

  final IconData icon;
  final String text;
  final bool isCategoryButton;
  final User? user;
  final Iterable<Products>? products;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isCategoryButton) {
          context.pushNamed(
            Routes.categorySelectedView,
            pathParameters: {
              Parameters.category: text,
            },
          );
        } else {
          if (text == 'Edit Profile' && user != null) {
            context.pushNamed(Routes.editProfileView, extra: user);
          } else if (text == 'History' && user != null) {
            context.pushNamed(Routes.historyView, extra: user);
          } else if (text == 'Change Password' && user != null) {
            context.pushNamed(Routes.changePasswordView);
          } else if (text == 'Logout' && user != null) {
            context.read<AuthBloc>().add(const AuthEventLogOut());
            context.goNamed(Routes.loginView);
          }
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Theme.of(context).colorScheme.primary,
        ),
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Row(
          spacing: 8.0,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Icon(
                icon,
                size: 32.0,
              ),
            ),
            text.textBody,
          ],
        ),
      ),
    );
  }
}
