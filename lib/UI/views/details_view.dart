import 'package:e_commerce/UI/extensions/text_style.dart';
import 'package:e_commerce/UI/widgets/custom_button_widget.dart';
import 'package:e_commerce/UI/widgets/product_details_widget.dart';
import 'package:e_commerce/logic/bloc/order_bloc/order_bloc.dart';
import 'package:e_commerce/logic/cubit/clikable/clickable_cubit.dart';
import 'package:e_commerce/routes/parameters.dart';
import 'package:e_commerce/data/models/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DetailsView extends StatelessWidget {
  final Products? data;

  const DetailsView({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final orders = context.watch<OrderBloc>().state.orders;
    final sameProduct = context.watch<OrderBloc>().state.sameProduct;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final heightButton = height / 10;
    return BlocBuilder<ClickableCubit, ClickableState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: 'Details'.textHeadline2,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: IconButton(
                  onPressed: () {
                    context.read<ClickableCubit>().clickChanged(
                          productName: data!.name,
                        );
                  },
                  icon: const Icon(Icons.favorite),
                  color: (state.favoriteList.contains(data!.name))
                      ? Colors.red
                      : Colors.white,
                ),
              )
            ],
          ),
          body: Stack(
            children: [
              ProductDetailsWidget(data: data!, spacing: heightButton),
              CustomButton(
                onTap: () {
                  context.read<OrderBloc>().add(OrderEventAddCart(
                        sameProduct: sameProduct?.toList(),
                        orders: orders?.toList(),
                        product: data,
                      ));
                  context.go(Parameters.homePath);
                },
                width: width,
                height: heightButton,
                itemPrice: data!.price,
              ),
            ],
          ),
        );
      },
    );
  }
}
