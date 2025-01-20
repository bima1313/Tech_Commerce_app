import 'package:e_commerce/logic/bloc/order_bloc/order_bloc.dart';
import 'package:e_commerce/data/enums/trigger_name.dart';
import 'package:e_commerce/data/models/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
    required this.orders,
    required this.productData,
    required this.items,
  });
  final List<Map<Products, int>> orders;
  final Products productData;
  final int items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Row(
        spacing: 8.0,
        children: [
          GestureDetector(
            onTap: () => context.read<OrderBloc>().add(
                  OrderEventEditableItems(
                    productData: productData,
                    items: items,
                    triggerName: TriggerName.remove,
                  ),
                ),
            child: const Icon(
              Icons.remove,
              color: Colors.black,
              size: 20.0,
            ),
          ),
          Text(
            items.toString(),
            style: const TextStyle(
              fontSize: 20.0,
            ),
          ),
          GestureDetector(
            onTap: () => context.read<OrderBloc>().add(
                  OrderEventEditableItems(
                    productData: productData,
                    items: items,
                    triggerName: TriggerName.add,
                  ),
                ),
            child: const Icon(
              Icons.add,
              color: Colors.black,
              size: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
