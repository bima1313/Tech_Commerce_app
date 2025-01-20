import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/UI/extensions/text_style.dart';
import 'package:e_commerce/UI/widgets/address_widgets/address_widget.dart';
import 'package:e_commerce/UI/widgets/total_widget.dart';
import 'package:e_commerce/data/models/orders.dart';
import 'package:e_commerce/data/models/products.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryDetailsView extends StatelessWidget {
  final Orders? orders;
  final Iterable<Products>? productData;
  const HistoryDetailsView({
    super.key,
    required this.orders,
    required this.productData,
  });

  @override
  Widget build(BuildContext context) {
    final Iterable<Products>? sortProducts;
    final cacheProducts = productData?.toList();
    cacheProducts?.sort((a, b) => a.numRatings.compareTo(b.numRatings));
    sortProducts = cacheProducts;
    final currency = NumberFormat.currency(decimalDigits: 2, symbol: '\$');
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: 'History Details'.textHeadline2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 24.0,
            children: [
              ListView.builder(
                shrinkWrap: true,
                prototypeItem: Container(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 8,
                  child: Row(
                    spacing: 8.0,
                    children: [
                      Expanded(
                        flex: 5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: CachedNetworkImage(
                            imageUrl: '',
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
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ''.textBody,
                            currency.format(0).textBody,
                          ],
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'x${0}',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                itemCount: sortProducts!.length,
                itemBuilder: (context, index) {
                  final data = sortProducts!.elementAt(index);
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 8,
                    child: Row(
                      spacing: 8.0,
                      children: [
                        Expanded(
                          flex: 5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: CachedNetworkImage(
                              imageUrl: data.image,
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
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              data.name.textBody,
                              currency.format(data.price).textBody,
                            ],
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'x${orders!.orders.values.elementAt(index)}',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              AddressWidget(isHistory: true),
              TotalWidget(subTotal: orders!.total),
              const SizedBox(height: 72.0)
            ],
          ),
        ),
      ),
    );
  }
}
