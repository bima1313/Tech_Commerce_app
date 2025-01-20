import 'package:cached_network_image/cached_network_image.dart'
    show CachedNetworkImage;
import 'package:e_commerce/data/enums/product_data.dart';
import 'package:e_commerce/UI/extensions/get_product.dart';
import 'package:e_commerce/data/models/products.dart';
import 'package:e_commerce/UI/widgets/name_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart' show Shimmer;

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    super.key,
    this.index,
    this.data,
  });
  final int? index;
  final Iterable<Products>? data;
  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return Shimmer.fromColors(
        baseColor: const Color.fromARGB(255, 189, 189, 189),
        highlightColor: const Color.fromARGB(255, 238, 238, 238),
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 189, 189, 189),
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      );
    } else {
      return SizedBox(
        height: 200,
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: CachedNetworkImage(
                  width: MediaQuery.of(context).size.width,
                  imageUrl: index?.ofProduct(data, ProductData.image),
                  fit: BoxFit.cover,
                  placeholder: (context, url) {
                    return const ColoredBox(
                      color: Colors.white,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            Expanded(
              child: NameProductWidget(
                nameProduct: index?.ofProduct(data, ProductData.productName),
                starRating: index?.ofProduct(data, ProductData.starRating),
              ),
            ),
            Expanded(
              child: Text(
                index?.ofProduct(data, ProductData.price),
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
