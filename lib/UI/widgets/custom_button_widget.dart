import 'package:e_commerce/UI/extensions/text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.width,
    required this.height,
    this.padding = EdgeInsets.zero,
    this.itemPrice = 0,
    this.total = 0,
    this.checkout = false,
  });
  final void Function()? onTap;
  final EdgeInsetsGeometry padding;
  final double width;
  final double height;
  final double? total;
  final bool checkout;
  final double? itemPrice;

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(decimalDigits: 2, symbol: '\$');

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.0),
            topRight: Radius.circular(32.0),
          ),
        ),
        child: Padding(
          padding: padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              (checkout)
                  ? Align(
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          'Total'.textHeadline2,
                          Padding(
                            padding: const EdgeInsets.only(top: 24.0),
                            child: currency.format(total).textHeadline1,
                          ),
                        ],
                      ),
                    )
                  : currency.format(itemPrice).textHeadline1,
              Container(
                height: height / 2,
                width: width / 2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: GestureDetector(
                  onTap: onTap,
                  child: Align(
                    alignment: Alignment.center,
                    child: (checkout)
                        ? 'Checkout'.textHeadline2
                        : 'Add to Cart'.textHeadline2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
