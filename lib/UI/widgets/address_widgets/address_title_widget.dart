import 'package:e_commerce/UI/extensions/text_style.dart';
import 'package:flutter/material.dart';

class AddressTitleWidget extends StatelessWidget {
  const AddressTitleWidget({super.key, required this.isHistory});
  final bool? isHistory;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: const Icon(
                  Icons.location_on,
                  color: Colors.amber,
                ),
              ),
              'Address'.textHeadline2,
            ],
          ),
        ),
        (isHistory == false) ? 'See All'.textBody : const SizedBox(),
      ],
    );
  }
}
