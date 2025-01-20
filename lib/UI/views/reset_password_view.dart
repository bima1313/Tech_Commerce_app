import 'package:e_commerce/UI/extensions/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ResetPasswordView extends HookWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final email = useTextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: 'Reset Password'.textHeadline2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 32.0,
          children: [
            TextField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                label: const Text('email'),
                hintText: 'Enter your email',
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
              child: 'Send Reset Password'.textHeadline2,
            ),
          ],
        ),
      ),
    );
  }
}
