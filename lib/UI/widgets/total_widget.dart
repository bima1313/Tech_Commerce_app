import 'package:e_commerce/UI/widgets/column_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TotalWidget extends StatelessWidget {
  const TotalWidget({super.key, required this.subTotal});
  final double subTotal;

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(decimalDigits: 2, symbol: '\$');
    final double deliveryFee = 5;
    final totalOrder = subTotal + deliveryFee;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Theme.of(context).colorScheme.primary,
      ),
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ColumnTextWidget(
              texts: ['Sub Total', 'Delivery Fee', 'Total'],
            ),
            ColumnTextWidget(
              texts: [
                currency.format(subTotal),
                '\$5',
                currency.format(totalOrder),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
