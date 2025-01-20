import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/UI/extensions/text_style.dart';
import 'package:e_commerce/data/constants/image_asset.dart';
import 'package:e_commerce/data/models/products.dart';
import 'package:flutter/material.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({
    super.key,
    required this.data,
    required this.spacing,
  });
  final Products data;
  final double spacing;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 250.0,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: CachedNetworkImage(
                imageUrl: data.image,
                fit: BoxFit.fill,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error_outline),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8.0,
              children: [
                data.name.textHeadline2,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 8.0,
                  children: [
                    Image.asset(
                      star,
                      height: 24,
                      width: 24,
                    ),
                    data.starRating.toString().textHeadline2,
                  ],
                ),
                'Description'.textHeadline2,
                data.description.descriptionText,
                SizedBox(height: spacing),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
