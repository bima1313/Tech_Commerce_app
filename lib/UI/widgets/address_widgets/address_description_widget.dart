import 'package:e_commerce/UI/extensions/text_style.dart';
import 'package:flutter/material.dart';

class AddressDescriptionWidget extends StatelessWidget {
  const AddressDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          'Bima Andika | +62 853 9532 8539'.textBody,
          'Jl. nama baru no.52'.textBody,
          'Medan, Indonesia'.textBody,
        ],
      ),
    );
  }
}
