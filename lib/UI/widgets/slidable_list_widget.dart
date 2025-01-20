import 'package:e_commerce/UI/widgets/custom_sliding_action.dart';
import 'package:e_commerce/UI/widgets/list_tile_widget.dart';
import 'package:e_commerce/data/enums/trigger_name.dart';
import 'package:e_commerce/data/models/products.dart';
import 'package:e_commerce/logic/bloc/order_bloc/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableList extends StatelessWidget {
  /// Creates a [SlidableList].
  ///
  /// The [products], [item] and [items] arguments must be not null.

  const SlidableList({
    super.key,
    required this.products,
    required this.items,
    required this.item,
  });

  /// An data of products.
  final List<Map<Products, int>> products;

  /// The items of Orders
  final Map<Products, int> items;

  /// The item of data product
  final Products item;

  @override
  Widget build(BuildContext context) {
    if (products.length == 1) {
      return ListTileWidget(
        products: products,
        items: items,
        item: item,
      );
    } else {
      return Slidable(
        endActionPane: ActionPane(
          motion: const BehindMotion(),
          children: [
            CustomSlidingAction(
              backgroundColor: Colors.red,
              label: 'Delete',
              icon: Icons.delete,
              onPressed: (context) => context.read<OrderBloc>().add(
                    OrderEventEditableItems(
                      productData: item,
                      items: 0,
                      triggerName: TriggerName.delete,
                    ),
                  ),
            ),
          ],
        ),
        child: ListTileWidget(
          products: products,
          items: items,
          item: item,
        ),
      );
    }
  }
}
