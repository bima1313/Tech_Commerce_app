import 'package:e_commerce/UI/extensions/text_style.dart';
import 'package:e_commerce/UI/widgets/cart_button_widget.dart';
import 'package:e_commerce/logic/bloc/auth_bloc/auth_bloc.dart';
import 'package:e_commerce/UI/widgets/carousel_widget.dart';
import 'package:e_commerce/UI/widgets/categories_chip_widget.dart';
import 'package:e_commerce/UI/widgets/product_gridview_widget.dart';
import 'package:e_commerce/logic/bloc/main_bloc/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthBloc>().state.user;
    final data = context.watch<MainBloc>().state.products;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: 'Hello, ${user?.displayName}'.textHeadline2,
        actions: const [CartButtonWidget()],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: const CarouselWidget(
                height: 250.0,
                margin: EdgeInsets.symmetric(horizontal: 8.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CategoriesChipWidget(),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: 'Best Sellers'.textHeadline2,
                  ),
                  ProductGridViewWidget(
                    products: data,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
