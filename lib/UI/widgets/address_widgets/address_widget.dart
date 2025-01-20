import 'package:e_commerce/UI/widgets/address_widgets/address_description_widget.dart';
import 'package:e_commerce/UI/widgets/address_widgets/address_title_widget.dart';
import 'package:flutter/material.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({super.key, this.isHistory = false});
  final bool? isHistory;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Theme.of(context).colorScheme.primary,
        ),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8.0,
            children: [
              AddressTitleWidget(isHistory: isHistory),
              const AddressDescriptionWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
