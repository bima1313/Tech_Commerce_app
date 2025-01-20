import 'package:e_commerce/UI/widgets/slidable_list_widget.dart';
import 'package:e_commerce/data/models/products.dart';
import 'package:e_commerce/logic/bloc/order_bloc/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<OrderBloc>().state.orders ?? [];
    final Iterable<Map<Products, int>> cacheProducts;
    products.sort((a, b) => a.keys.first.name.compareTo(b.keys.first.name));
    cacheProducts = products;
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      prototypeItem: SlidableList(
        products: products,
        items: cacheProducts.first,
        item: cacheProducts.first.keys.first,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final items = cacheProducts.elementAt(index);
        final item = items.keys.first;
        return SlidableList(
          products: products,
          items: items,
          item: item,
        );
      },
    );
  }
}
