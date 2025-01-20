import 'package:e_commerce/UI/extensions/text_style.dart';
import 'package:flutter/material.dart';

class ColumnTextWidget extends StatelessWidget {
  final List<String> texts;
  const ColumnTextWidget({super.key, required this.texts});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        texts[0].textBody,
        texts[1].textBody,
        texts[2].textBody,
      ],
    );
  }
}
