import 'package:e_commerce/UI/widgets/search_widget.dart';
import 'package:e_commerce/UI/widgets/categories_chip_widget.dart';
import 'package:e_commerce/UI/widgets/product_gridview_widget.dart';
import 'package:e_commerce/logic/bloc/main_bloc/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.watch<MainBloc>().state.products;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16.0,
            children: [
              const SearchWidget(),
              const CategoriesChipWidget(),
              ProductGridViewWidget(products: data),
            ],
          ),
        )),
      ),
    );
  }
}
