import 'package:flutter/foundation.dart';

import 'configs/app_bar_config.dart';

abstract class ComponentConfig {
  const ComponentConfig({required this.name});

  final String name;

  @protected
  String type<T extends ComponentConfig>() {
    return T.toString().toKebabCase();
  }

  static ComponentConfig decode(String type, Map<String, dynamic> rawConfig) {
    switch (type) {
      case 'app-bar':
        return AppBarConfig.from(rawConfig);
    }

    throw UnsupportedError('Unsupported component type: $type');
  }
}

extension on String {
  String toKebabCase() {
    return '${substring(0, 1).toLowerCase()}'
        '${substring(1).replaceAllMapped(
      RegExp(r'([A-Z])'),
      (match) => '-${match.group(0)!.toLowerCase()}',
    )}';
  }
}
