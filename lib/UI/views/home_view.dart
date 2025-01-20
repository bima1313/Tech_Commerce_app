import 'package:e_commerce/UI/utilities/bottom_navigation_list.dart';
import 'package:e_commerce/UI/utilities/pages.dart';
import 'package:e_commerce/logic/cubit/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarCubit(),
      child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, bottomNavState) {
          return Scaffold(
            body: Pages(index: bottomNavState.index),
            bottomNavigationBar: NavigationBar(
              indicatorColor: Colors.blue,
              selectedIndex: bottomNavState.index,
              onDestinationSelected: (value) {
                context.read<BottomNavBarCubit>().tabChange(index: value);
              },
              destinations: items,
            ),
          );
        },
      ),
    );
  }
}
