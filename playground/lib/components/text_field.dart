import 'package:acme_theme_provider/acme_theme_provider.dart';
import 'package:flutter/material.dart';

class FirstTextField extends StatelessWidget {
  const FirstTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CoreTextField(
      parent: this,
      inputDecoration: const InputDecoration(hintText: 'First Text Field'),
    );
  }
}

class SecondTextField extends StatelessWidget {
  const SecondTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CoreTextField(
      parent: this,
      inputDecoration: const InputDecoration(labelText: 'Second Text Field'),
    );
  }
}
