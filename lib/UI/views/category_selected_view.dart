import 'package:e_commerce/UI/extensions/text_style.dart';
import 'package:e_commerce/logic/bloc/main_bloc/main_bloc.dart';
import 'package:e_commerce/UI/widgets/product_gridview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategorySelectedView extends StatelessWidget {
  final String? category;
  const CategorySelectedView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<MainBloc>().state.products;
    final selectedCategory = products!.where(
      (element) => element.category == category,
    );
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: category!.textHeadline2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProductGridViewWidget(
            products: selectedCategory,
            itemCount: selectedCategory.length,
          ),
        ),
      ),
    );
  }
}
