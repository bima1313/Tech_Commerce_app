import 'package:e_commerce/UI/extensions/text_style.dart';
import 'package:e_commerce/UI/widgets/address_widgets/address_widget.dart';
import 'package:e_commerce/UI/widgets/list_view_widget.dart';
import 'package:e_commerce/UI/widgets/custom_button_widget.dart';
import 'package:e_commerce/UI/widgets/total_widget.dart';
import 'package:e_commerce/logic/bloc/auth_bloc/auth_bloc.dart';
import 'package:e_commerce/logic/bloc/main_bloc/main_bloc.dart';
import 'package:e_commerce/logic/bloc/order_bloc/order_bloc.dart';
import 'package:e_commerce/routes/parameters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = context.watch<AuthBloc>().state.user;
    final total = context.watch<OrderBloc>().state.totalPrices ?? 0;
    final double deliveryFee = 5;
    final totalOrder = total + deliveryFee;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final heightButton = height / 10;

    return BlocConsumer<OrderBloc, OrderState>(listener: (context, orderState) {
      if (orderState.isLoading) {
        EasyLoading.show(status: 'Loading...');
      } else {
        if (orderState is OrderStateCheckout) {
          EasyLoading.showSuccess('Success');
          EasyLoading.dismiss();
          context.read<MainBloc>().add(const MainEventCheckoutCompleted());
          context.go(Parameters.homePath);
        } else {
          EasyLoading.dismiss();
        }
      }
    }, builder: (context, orderState) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: 'Cart'.textHeadline2,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 24.0,
                  children: [
                    const ListViewWidget(),
                    const AddressWidget(),
                    TotalWidget(subTotal: total),
                    const SizedBox(height: 72.0)
                  ],
                ),
              ),
            ),
            CustomButton(
              onTap: () => context.read<OrderBloc>().add(
                    OrderEventCheckout(
                      userId: userId!.uid,
                      total: totalOrder,
                    ),
                  ),
              width: width,
              height: heightButton,
              total: total,
              checkout: true,
            ),
          ],
        ),
      );
    });
  }
}
