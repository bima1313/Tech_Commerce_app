import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/data/models/products.dart';
import 'package:e_commerce/UI/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductGridViewWidget extends StatelessWidget {
  const ProductGridViewWidget({
    super.key,
    this.products,
    this.itemCount = 20,
  });

  final Iterable<Products>? products;
  final int? itemCount;
  @override
  Widget build(BuildContext context) {
    final Iterable<Products> bestSellers;
    final cacheProducts = products?.toList();
    cacheProducts?.sort((a, b) => a.numRatings.compareTo(b.numRatings));
    if (cacheProducts != null) {
      bestSellers = cacheProducts.reversed;
    } else {
      bestSellers = [];
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
          ),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (products != null) {
                  context.pushNamed(
                    Routes.detailsView,
                    extra: bestSellers.elementAt(index),
                  );
                } else {
                  null;
                }
              },
              child: (products != null)
                  ? CustomCardWidget(
                      index: index,
                      data: bestSellers,
                    )
                  : const CustomCardWidget(),
            );
          }),
    );
  }
}
