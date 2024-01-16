import 'package:acme_theme/acme_theme.dart';
import 'package:flutter/src/widgets/framework.dart';

class FirstSlider extends CoreSlider {
  const FirstSlider({
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

class SecondSlider extends CoreSlider {
  const SecondSlider({
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
