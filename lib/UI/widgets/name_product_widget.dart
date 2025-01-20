import 'package:e_commerce/UI/extensions/text_style.dart';
import 'package:e_commerce/data/constants/image_asset.dart';
import 'package:flutter/material.dart';

class NameProductWidget extends StatelessWidget {
  const NameProductWidget({
    super.key,
    required this.nameProduct,
    required this.starRating,
  });

  final String nameProduct;
  final String starRating;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: nameProduct.textBody,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                star,
                height: 16,
                width: 16,
              ),
              starRating.textBody,
            ],
          ),
        ),
      ],
    );
  }
}
