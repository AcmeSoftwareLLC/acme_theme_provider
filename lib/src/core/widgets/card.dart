import 'package:acme_theme/src/core/configs/card_config.dart';
import 'package:acme_theme/src/core/core_widget.dart';
import 'package:flutter/material.dart';

abstract class CoreCard extends CoreWidget<CardConfig> {
  const CoreCard({
    super.key,
    super.name,
    required this.child,
  });

  final Widget child;

  @override
  Widget render(BuildContext context, CardConfig config) {
    return Theme(
      data: Theme.of(context).copyWith(cardTheme: config.theme),
      child: Card(
        semanticContainer: config.semanticContainer,
        borderOnForeground: config.borderOnForeground,
        child: child,
      ),
    );
  }
}
