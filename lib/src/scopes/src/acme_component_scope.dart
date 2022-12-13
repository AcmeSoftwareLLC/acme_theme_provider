import '../../core/component_config.dart';
import 'package:flutter/widgets.dart';

import 'acme_theme_scope.dart';

class AcmeComponentScope extends InheritedWidget {
  const AcmeComponentScope({
    super.key,
    required this.components,
    required super.child,
  });

  final Map<String, ComponentConfig> components;

  @override
  bool updateShouldNotify(AcmeComponentScope oldWidget) {
    return oldWidget.components != components;
  }
}

extension ComponentConfigExtension on BuildContext {
  T config<T extends ComponentConfig>(String name) {
    return AcmeThemeScope.componentOf<T>(this, name);
  }
}
