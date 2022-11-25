import 'package:acme_theme_provider/src/core/configs/button_config.dart';
import 'package:acme_theme_provider/src/core/configs/card_config.dart';
import 'package:acme_theme_provider/src/core/configs/dropdown_button_config.dart';
import 'package:acme_theme_provider/src/core/configs/text_field_config.dart';

import 'configs/app_bar_config.dart';

export 'configs/app_bar_config.dart';

enum ComponentType {
  appBar('app.bar'),
  button('button'),
  textField('text.field'),
  card('card'),
  dropDown('dropdown.button'),
  unknown('unknown');

  const ComponentType(this.value);

  final String value;
}

abstract class ComponentConfig {
  const ComponentConfig();

  static ComponentConfig decode(String type, Map<String, dynamic> rawConfig) {
    final resolvedType = ComponentType.values.firstWhere(
      (e) => e.value == type,
      orElse: () => ComponentType.unknown,
    );

    switch (resolvedType) {
      case ComponentType.appBar:
        return AppBarConfig.fromMap(rawConfig);
      case ComponentType.button:
        return ButtonConfig.fromMap(rawConfig);
      case ComponentType.textField:
        return TextFieldConfig.fromMap(rawConfig);
      case ComponentType.card:
        return CardConfig.fromMap(rawConfig);
      case ComponentType.dropDown:
        return DropdownButtonConfig.fromMap(rawConfig);
      case ComponentType.unknown:
        throw UnsupportedError('Unsupported component type: $type');
    }
  }

  Map<String, dynamic> toMap();
}
