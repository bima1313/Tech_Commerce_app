import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/data/models/products.dart';
import 'package:flutter/material.dart';

class ListTileSearch extends StatelessWidget {
  const ListTileSearch({
    super.key,
    required this.product,
  });

  final Products product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: product.image,
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
          ),
          Expanded(
            flex: 2,
            child: Text(
              product.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          )
        ],
      ),
    );
  }
}
