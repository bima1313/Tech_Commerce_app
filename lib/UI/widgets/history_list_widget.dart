import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/UI/extensions/text_style.dart';
import 'package:e_commerce/UI/utilities/cast_date_time.dart';
import 'package:e_commerce/data/get_products.dart';
import 'package:e_commerce/data/models/orders.dart';
import 'package:e_commerce/logic/bloc/main_bloc/main_bloc.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class HistoryListWidget extends StatelessWidget {
  const HistoryListWidget({super.key, required this.orderHistories});
  final Iterable<Orders>? orderHistories;
  @override
  Widget build(BuildContext context) {
    final products = context.watch<MainBloc>().state.products;
    final currency = NumberFormat.currency(decimalDigits: 2, symbol: '\$');
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      prototypeItem: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ''.textBody,
                  const Divider(
                    color: Colors.black,
                    thickness: 2.0,
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Row(
                        spacing: 8.0,
                        children: [
                          CachedNetworkImage(
                            imageUrl: '',
                            width: 100,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) => const Center(
                              child: Icon(
                                Icons.error_outline,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ''.textBody,
                                currency.format(0).textBody,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      'Total Payment = ${currency.format(0)}'.textBody,
                      'View All'.textButton,
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      itemCount: orderHistories?.length,
      itemBuilder: (context, index) {
        final data = orderHistories?.elementAt(index);
        final productsData = getProducts(getData: data!, fromData: products!);

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: GestureDetector(
            onTap: () => context.pushNamed(
              Routes.historyDetailsView,
              extra: {'orders': data, 'productsData': productsData},
            ),
            child: Container(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    castDateTime(dateTime: data.dateTime.toDate()).textBody,
                    const Divider(
                      color: Colors.black,
                      thickness: 2.0,
                    ),
                    Expanded(
                      child: SizedBox(
                        child: Row(
                          spacing: 8.0,
                          children: [
                            CachedNetworkImage(
                              imageUrl: productsData.first.image,
                              width: 100,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Center(
                                child: Icon(
                                  Icons.error_outline,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  productsData.first.name.textBody,
                                  currency
                                      .format(productsData.first.price)
                                      .textBody,
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        'Total Payment = ${currency.format(data.total)}'
                            .textBody,
                        'View All'.textButton,
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
