import 'package:e_commerce/UI/extensions/text_style.dart';
import 'package:e_commerce/data/constants/categories.dart';
import 'package:e_commerce/UI/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: 'Categories'.textHeadline2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          prototypeItem: const CustomElevatedButton(
            icon: Icons.monitor,
            text: '',
            isCategoryButton: true,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories.elementAt(index);
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: CustomElevatedButton(
                icon: category[0],
                text: category[1],
                isCategoryButton: true,
              ),
            );
          },
        ),
      ),
    );
  }
}
