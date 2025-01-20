import 'package:e_commerce/UI/extensions/text_style.dart';
import 'package:e_commerce/UI/widgets/product_gridview_widget.dart';
import 'package:e_commerce/data/models/products.dart';
import 'package:e_commerce/logic/bloc/main_bloc/main_bloc.dart';
import 'package:e_commerce/logic/cubit/clikable/clickable_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteList = context.watch<ClickableCubit>().state.favoriteList;
    final products = context.watch<MainBloc>().state.products;
    List<Products> favoriteProducts = [];
    for (int index = 0; index < favoriteList.length; index++) {
      final product = products!
          .where(
            (item) => item.name == favoriteList.elementAt(index),
          )
          .single;
      favoriteProducts.add(product);
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: 'Favorite'.textHeadline2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: (favoriteProducts.isNotEmpty)
              ? ProductGridViewWidget(
                  products: favoriteProducts,
                  itemCount: favoriteProducts.length,
                )
              : null,
        ),
      ),
    );
  }
}
