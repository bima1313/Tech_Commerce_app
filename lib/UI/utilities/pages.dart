import 'package:e_commerce/UI/pages/favorite_page.dart';
import 'package:e_commerce/UI/pages/home_page.dart';
import 'package:e_commerce/UI/pages/profile_page.dart';
import 'package:e_commerce/UI/pages/search_page.dart';
import 'package:flutter/material.dart';

class Pages extends StatelessWidget {
  const Pages({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        switch (index) {
          case 0:
            return const HomePage();
          case 1:
            return const SearchPage();
          case 2:
            return const FavoritePage();
          default:
            return const ProfilePage();
        }
      },
    );
  }
}
