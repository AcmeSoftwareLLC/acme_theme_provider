import 'package:acme_theme/acme_theme.dart';
import 'package:flutter/material.dart';

class FirstCard extends CoreCard {
  FirstCard({
    super.key,
    required Widget child,
    EdgeInsetsGeometry padding = const EdgeInsets.all(8),
  }) : super(child: Padding(padding: padding, child: child));

  @override
  StringBuffer getWidgetbookExportCode(BuildContext context) {
    // TODO: implement getWidgetbookExportCode
    throw UnimplementedError();
  }
}

class SecondCard extends CoreCard {
  const SecondCard({
    super.key,
    required super.child,
  });

  @override
  StringBuffer getWidgetbookExportCode(BuildContext context) {
    // TODO: implement getWidgetbookExportCode
    throw UnimplementedError();
  }
}
