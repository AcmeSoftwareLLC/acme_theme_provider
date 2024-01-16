import 'package:acme_theme/acme_theme.dart';
import 'package:flutter/src/widgets/framework.dart';

class FirstDropdownButton extends CoreDropdownButton {
  const FirstDropdownButton({
    super.key,
    super.hint,
  });

  @override
  StringBuffer getWidgetbookExportCode(BuildContext context) {
    // TODO: implement getWidgetbookExportCode
    throw UnimplementedError();
  }
}

class SecondDropdownButton extends CoreDropdownButton<String> {
  const SecondDropdownButton({
    super.key,
    super.hint,
    super.value,
    super.items,
    super.onChanged,
  });

  @override
  StringBuffer getWidgetbookExportCode(BuildContext context) {
    // TODO: implement getWidgetbookExportCode
    throw UnimplementedError();
  }
}
