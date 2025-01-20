import 'package:e_commerce/UI/utilities/dialogs/generic_dialog.dart';
import 'package:e_commerce/data/api/firebase/auth/auth_errors.dart';
import 'package:flutter/material.dart';

Future<void> showAuthError({
  required AuthError authError,
  required BuildContext context,
}) async {
  await showGenericDialog(
    context: context,
    title: authError.dialogTitle,
    content: authError.dialogText,
    optionBuilder: () => {
      'OK': true,
    },
  );
}
