// Copyright (c) 2022. Acme Software LLC. All rights reserved.

import '../../core/component_config.dart';
import 'package:flutter/widgets.dart';

import 'acme_theme_scope.dart';

/// A [Widget] that provide [ComponentConfig]s to its descendants.
class AcmeComponentScope extends InheritedWidget {
  /// Creates a [AcmeComponentScope] that provide [ComponentConfig]s to its descendants.
  const AcmeComponentScope({
    super.key,
    required this.components,
    required super.child,
  });

  /// The [AcmeComponentConfig]s to be used by the [AcmeThemeScope].
  final Map<String, ComponentConfig> components;

  @override
  bool updateShouldNotify(AcmeComponentScope oldWidget) {
    return oldWidget.components != components;
  }
}

/// An extension on [BuildContext] that provides access to the [ComponentConfig]
/// for the current [BuildContext].
extension ComponentConfigExtension on BuildContext {
  /// Returns the [ComponentConfig] for the [name].
  T config<T extends ComponentConfig>(String name) {
    return AcmeThemeScope.componentOf<T>(this, name);
  }
}
