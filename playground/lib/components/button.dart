import 'package:acme_theme_provider/acme_theme_provider.dart';
import 'package:flutter/material.dart';

class AcmeOutlinedButton extends StatelessWidget {
  const AcmeOutlinedButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CoreButton(
      parent: this,
      onPressed: onPressed,
      child: child,
    );
  }
}

class AcmeTextButton extends StatelessWidget {
  const AcmeTextButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CoreButton(
      parent: this,
      onPressed: onPressed,
      child: child,
    );
  }
}

class AcmeElevatedButton extends StatelessWidget {
  const AcmeElevatedButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CoreButton(
      parent: this,
      onPressed: onPressed,
      child: child,
    );
  }
}
