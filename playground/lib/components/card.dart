import 'package:acme_theme_provider/acme_theme_provider.dart';
import 'package:flutter/material.dart';

class FirstCard extends CoreCard {
  FirstCard({
    super.key,
    required Widget child,
    EdgeInsetsGeometry padding = const EdgeInsets.all(8),
  }) : super(child: Padding(padding: padding, child: child));
}

class SecondCard extends CoreCard {
  const SecondCard({
    super.key,
    required super.child,
  });
}
