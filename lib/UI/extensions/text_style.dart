import 'package:flutter/material.dart';

extension Styles on String {
  Text get textHeadline1 => Text(
        this,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
        ),
      );
  Text get textHeadline2 => Text(
        this,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      );
  Text get descriptionText => Text(
        this,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16.0,
        ),
        textAlign: TextAlign.justify,
      );
  Text get textBody => Text(
        this,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      );
  Text get textButton => Text(
        this,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Colors.blueAccent,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      );
}
