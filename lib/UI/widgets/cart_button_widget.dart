import 'package:e_commerce/UI/extensions/text_style.dart';
import 'package:e_commerce/logic/bloc/order_bloc/order_bloc.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CartButtonWidget extends StatelessWidget {
  const CartButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = context.watch<OrderBloc>().state.orders;
    return Container(
      margin: const EdgeInsets.only(right: 8.0, bottom: 8.0),
      width: 50,
      height: 50,
      child: GestureDetector(
        onTap: () {
          if (orders != null) {
            context.read<OrderBloc>().add(
                  OrderEventGoToCartView(
                    orders: orders,
                  ),
                );
            context.pushNamed(Routes.cartView);
          } else {
            null;
          }
        },
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.shopping_bag,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            (orders != null)
                ? Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      radius: 13.0,
                      backgroundColor: Colors.green[400],
                      child: orders.length.toString().textBody,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
