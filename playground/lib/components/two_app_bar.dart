import 'package:acme_theme_provider/acme_theme_provider.dart';
import 'package:flutter/material.dart';

class TwoAppBar extends StatelessWidget {
  const TwoAppBar({
    super.key,
    required this.title,
    this.leading,
  });

  final Widget title;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return CoreAppBar(
      parent: this,
      title: title,
      leading: leading,
    );
  }
}
