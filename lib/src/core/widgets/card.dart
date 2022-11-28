import 'package:acme_theme_provider/src/core/configs/card_config.dart';
import 'package:acme_theme_provider/src/core/core_widget.dart';
import 'package:flutter/material.dart';

class CoreCard<T extends Object> extends CoreWidget<T> {
  const CoreCard({
    super.key,
    required super.parent,
    required this.child,
  });

  final Widget child;

  @override
  CoreState<CoreCard, CardConfig> createState() => _CoreCardState();
}

class _CoreCardState extends CoreState<CoreCard, CardConfig> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Theme(
      data: Theme.of(context).copyWith(cardTheme: config.theme),
      child: Card(
        semanticContainer: config.semanticContainer,
        borderOnForeground: config.borderOnForeground,
        child: widget.child,
      ),
    );
  }
}
