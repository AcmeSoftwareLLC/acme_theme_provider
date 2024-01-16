import 'package:acme_theme/acme_theme.dart';
import 'package:flutter/src/widgets/framework.dart';

class FirstChip extends CoreChip {
  const FirstChip({
    super.key,
    required super.label,
  });

  @override
  StringBuffer getWidgetbookExportCode(BuildContext context) {
    // TODO: implement getWidgetbookExportCode
    throw UnimplementedError();
  }
}

class SecondChip extends CoreChip {
  const SecondChip({
    super.key,
    required super.label,
  });

  @override
  StringBuffer getWidgetbookExportCode(BuildContext context) {
    // TODO: implement getWidgetbookExportCode
    throw UnimplementedError();
  }
}
