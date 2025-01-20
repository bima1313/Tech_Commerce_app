import 'package:e_commerce/UI/extensions/text_style.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/data/constants/categories.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoriesChipWidget extends StatelessWidget {
  const CategoriesChipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            'Categories'.textHeadline2,
            TextButton(
              onPressed: () {
                context.pushNamed(Routes.categoriesView);
              },
              child: 'See All'.textBody,
            ),
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories.elementAt(index);
              final String label = category[1];

              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ChoiceChip(
                  backgroundColor: Colors.white,
                  avatar: Icon(
                    category[0],
                    color: Colors.black,
                  ),
                  label: label.textBody,
                  showCheckmark: false,
                  selected: false,
                  onSelected: (value) {},
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
