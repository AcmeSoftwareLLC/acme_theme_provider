// Copyright (c) 2022. Acme Software LLC. All rights reserved.

import 'package:flutter/material.dart';

import 'configs/alert_dialog_config.dart';
import 'configs/app_bar_config.dart';
import 'configs/button_config.dart';
import 'configs/card_config.dart';
import 'configs/chip_config.dart';
import 'configs/dialog_config.dart';
import 'configs/dropdown_button_config.dart';
import 'configs/dropdown_menu_config.dart';
import 'configs/slider_config.dart';
import 'configs/snack_bar_config.dart';
import 'configs/switch_config.dart';
import 'configs/text_field_config.dart';

export 'configs/alert_dialog_config.dart';
export 'configs/app_bar_config.dart';
export 'configs/button_config.dart';
export 'configs/card_config.dart';
export 'configs/chip_config.dart';
export 'configs/dialog_config.dart';
export 'configs/dropdown_button_config.dart';
export 'configs/dropdown_menu_config.dart';
export 'configs/dropdown_menu_entry_config.dart';
export 'configs/slider_config.dart';
export 'configs/snack_bar_config.dart';
export 'configs/switch_config.dart';
export 'configs/text_field_config.dart';

/// The component type used to identify the component.
enum ComponentType {
  /// The component type for [AppBar].
  appBar('app.bar', 'AppBar'),

  /// The component type for [ButtonStyleButton].
  button('button', 'Button'),

  /// The component type for [TextField].
  textField('text.field', 'TextField'),

  /// The component type for [Card].
  card('card', 'Card'),

  /// The component type for [DropdownMenu].
  dropDownMenu('dropdown.menu', 'DropdownMenu'),

  /// The component type for [DropdownButton].
  dropDownButton('dropdown.button', 'DropdownButton'),

  /// The component type for [Switch].
  switchToggle('switch', 'Switch'),

  /// The component type for [Slider].
  slider('slider', 'Slider'),

  /// The component type for [Chip].
  chip('chip', 'Chip'),

  /// The component type for [SnackBar].
  snackBar('snack.bar', 'SnackBar'),

  /// The component type for [AlertDialog].
  alertDialog('alert.dialog', 'AlertDialog'),

  /// The component type for [Dialog].
  dialog('dialog', 'Dialog'),

  /// The unknown component type.
  unknown('unknown', 'Unknown');

  /// Creates a new component type.
  const ComponentType(this.value, this.name);

  /// The component type.
  final String value;

  /// The name of the component.
  final String name;
}

/// A base class for all component configs.
abstract class ComponentConfig {
  /// Creates an instance of [ComponentConfig].
  const ComponentConfig();

  /// Decodes the provided [rawConfig] into a [ComponentConfig], as per the provided [type].
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
      case ComponentType.dropDownMenu:
        return DropdownMenuConfig.fromMap(rawConfig);
      case ComponentType.dropDownButton:
        return DropdownButtonConfig.fromMap(rawConfig);
      case ComponentType.switchToggle:
        return SwitchConfig.fromMap(rawConfig);
      case ComponentType.slider:
        return SliderConfig.fromMap(rawConfig);
      case ComponentType.chip:
        return ChipConfig.fromMap(rawConfig);
      case ComponentType.snackBar:
        return SnackBarConfig.fromMap(rawConfig);
      case ComponentType.alertDialog:
        return AlertDialogConfig.fromMap(rawConfig);
      case ComponentType.dialog:
        return DialogConfig.fromMap(rawConfig);
      case ComponentType.unknown:
        throw UnsupportedError('Unsupported component type: $type');
    }
  }

  /// The Map representation of the config.
  Map<String, dynamic> toMap();
}
