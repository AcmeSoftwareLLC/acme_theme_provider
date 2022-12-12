import 'package:acme_theme_provider/acme_theme_provider.dart';
import 'package:flutter/material.dart';

class FirstTextField extends CoreTextField {
  const FirstTextField({
    super.key,
    super.inputDecoration = const InputDecoration(hintText: 'First Text Field'),
  });
}

class SecondTextField extends CoreTextField {
  const SecondTextField({
    super.key,
    super.inputDecoration = const InputDecoration(
      labelText: 'Second Text Field',
    ),
  });
}
