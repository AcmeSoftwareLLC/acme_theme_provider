import 'package:acme_theme/acme_theme.dart';
import 'package:flutter/src/widgets/framework.dart';

class FirstSwitch extends CoreSwitch {
  const FirstSwitch({
    super.key,
    required super.value,
    required super.onChanged,
  });

  @override
  StringBuffer getWidgetbookExportCode(BuildContext context) {
    // TODO: implement getWidgetbookExportCode
    throw UnimplementedError();
  }
}

class SecondSwitch extends CoreSwitch {
  const SecondSwitch({
    super.key,
    required super.value,
    required super.onChanged,
  });

  @override
  StringBuffer getWidgetbookExportCode(BuildContext context) {
    // TODO: implement getWidgetbookExportCode
    throw UnimplementedError();
  }
}
