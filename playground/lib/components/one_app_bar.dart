import 'package:acme_theme/acme_theme.dart';
import 'package:flutter/src/widgets/framework.dart';

class OneAppBar extends CoreAppBar {
  OneAppBar({
    super.key,
    required super.title,
    super.leading,
    super.bottom,
  });

  @override
  StringBuffer getWidgetbookExportCode(BuildContext context) {
    // TODO: implement getWidgetbookExportCode
    throw UnimplementedError();
  }
}
