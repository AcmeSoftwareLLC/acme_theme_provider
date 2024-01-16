import 'package:acme_theme/acme_theme.dart';
import 'package:flutter/src/widgets/framework.dart';

class FirstAlertDialog extends CoreAlertDialog {
  const FirstAlertDialog({
    super.key,
    super.icon,
    super.content,
    super.title,
    super.actions,
    super.scrollable,
  });

  @override
  StringBuffer getWidgetbookExportCode(BuildContext context) {
    // TODO: implement getWidgetbookExportCode
    throw UnimplementedError();
  }
}
