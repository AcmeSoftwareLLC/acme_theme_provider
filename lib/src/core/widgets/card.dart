// Copyright (c) 2022. Acme Software LLC. All rights reserved.

import 'package:flutter/material.dart';

import '../configs/card_config.dart';
import '../core_widget.dart';

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
