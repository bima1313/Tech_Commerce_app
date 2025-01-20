import 'package:e_commerce/UI/extensions/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ChangePasswordView extends HookWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final newPassword = useTextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: 'Change Password'.textHeadline2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 32.0,
          children: [
            TextField(
              controller: newPassword,
              obscureText: true,
              decoration: InputDecoration(
                label: const Text('new password'),
                hintText: 'Enter your password',
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                fixedSize: Size(
                  MediaQuery.of(context).size.width,
                  50,
                ),
              ),
              onPressed: () {},
              child: 'Change Password'.textHeadline2,
            ),
          ],
        ),
      ),
    );
  }
}
