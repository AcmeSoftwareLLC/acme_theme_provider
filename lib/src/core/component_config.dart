import 'package:acme_theme_provider/src/core/configs/button_config.dart';
import 'package:acme_theme_provider/src/core/configs/card_config.dart';
import 'package:acme_theme_provider/src/core/configs/chip_config.dart';
import 'package:acme_theme_provider/src/core/configs/dropdown_button_config.dart';
import 'package:acme_theme_provider/src/core/configs/slider_config.dart';
import 'package:acme_theme_provider/src/core/configs/snack_bar_config.dart';
import 'package:acme_theme_provider/src/core/configs/switch_config.dart';
import 'package:acme_theme_provider/src/core/configs/text_field_config.dart';

import 'configs/app_bar_config.dart';

export 'configs/app_bar_config.dart';
export 'configs/card_config.dart';
export 'configs/text_field_config.dart';
export 'configs/chip_config.dart';
export 'configs/dropdown_button_config.dart';
export 'configs/switch_config.dart';
export 'configs/button_config.dart';
export 'configs/slider_config.dart';
export 'configs/slider_config.dart';
export 'configs/snack_bar_config.dart';

enum ComponentType {
  appBar('app.bar', 'AppBar'),
  button('button', 'Button'),
  textField('text.field', 'TextField'),
  card('card', 'Card'),
  dropDown('dropdown.button', 'DropdownButton'),
  switchToggle('switch', 'Switch'),
  slider('slider', 'Slider'),
  chip('chip', 'Chip'),
  snackBar('snack.bar', 'SnackBar'),
  unknown('unknown', 'Unknown');

  const ComponentType(this.value, this.name);

  final String value;
  final String name;
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
      case ComponentType.switchToggle:
        return SwitchConfig.fromMap(rawConfig);
      case ComponentType.slider:
        return SliderConfig.fromMap(rawConfig);
      case ComponentType.chip:
        return ChipConfig.fromMap(rawConfig);
      case ComponentType.snackBar:
        return SnackBarConfig.fromMap(rawConfig);
      case ComponentType.unknown:
        throw UnsupportedError('Unsupported component type: $type');
    }
  }

  Map<String, dynamic> toMap();
}
