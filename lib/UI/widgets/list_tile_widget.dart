import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/UI/extensions/text_style.dart';
import 'package:e_commerce/UI/widgets/edit_button_widget.dart';
import 'package:e_commerce/data/models/products.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.products,
    required this.items,
    required this.item,
  });

  final List<Map<Products, int>> products;
  final Map<Products, int> items;
  final Products item;
  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(symbol: '\$');
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
      ),
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: CachedNetworkImage(
                imageUrl: item.image,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error_outline,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: currency.format(item.price).textBody,
                    ),
                  ],
                ),
              ),
            ),
          ),
          EditButton(
            orders: products,
            productData: item,
            items: items.values.first,
          ),
        ],
      ),
    );
  }
}
