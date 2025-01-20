import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBar({
  required BuildContext context,
  required String text,
}) {
  final snackBar = SnackBar(
    duration: Duration(seconds: 1),
    content: Text(text),
  );
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
