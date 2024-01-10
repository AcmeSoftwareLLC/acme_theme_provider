// Copyright (c) 2022. Acme Software LLC. All rights reserved.

import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_theme/json_theme.dart';

import '../component_config.dart';

class ChipConfig extends ComponentConfig {
  const ChipConfig({
    required this.theme,
    required this.clipBehaviour,
    required this.visualDensity,
    required this.materialTapTargetSize,
    required this.autofocus,
    required this.iconTheme,
    required this.surfaceTintColor,
    required this.deleteIconColor,
    this.defaultDeleteIcon,
  });

  final ChipThemeData? theme;

  final Clip clipBehaviour;
  final VisualDensity? visualDensity;
  final MaterialTapTargetSize? materialTapTargetSize;
  final bool autofocus;
  final IconThemeData? iconTheme;
  final Color? surfaceTintColor;
  final Color? deleteIconColor;
  final IconData? defaultDeleteIcon;

  factory ChipConfig.fromMap(Map<String, dynamic> map) {
    return ChipConfig(
      theme: _decodeChipThemeData(map['theme']),
      clipBehaviour: ThemeDecoder.decodeClip(map['clipBehaviour']) ?? Clip.none,
      visualDensity: ThemeDecoder.decodeVisualDensity(map['visualDensity']),
      materialTapTargetSize: ThemeDecoder.decodeMaterialTapTargetSize(
          map['materialTapTargetSize']),
      autofocus: map['autofocus'] ?? false,
      iconTheme: ThemeDecoder.decodeIconThemeData(map['iconTheme']),
      surfaceTintColor: ThemeDecoder.decodeColor(map['surfaceTintColor']),
      deleteIconColor: ThemeDecoder.decodeColor(map['deleteIconColor']),
      defaultDeleteIcon: ThemeDecoder.decodeIconData(map['defaultDeleteIcon']),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'type': ComponentType.chip.value,
      'theme': ThemeEncoder.encodeChipThemeData(theme),
      'clipBehaviour': ThemeEncoder.encodeClip(clipBehaviour),
      'visualDensity': ThemeEncoder.encodeVisualDensity(visualDensity),
      'materialTapTargetSize':
          ThemeEncoder.encodeMaterialTapTargetSize(materialTapTargetSize),
      'autofocus': autofocus,
      'iconTheme': ThemeEncoder.encodeIconThemeData(iconTheme),
      'surfaceTintColor': ThemeEncoder.encodeColor(surfaceTintColor),
      'deleteIconColor': ThemeEncoder.encodeColor(deleteIconColor),
      'defaultDeleteIcon': ThemeEncoder.encodeIconData(defaultDeleteIcon),
    };
  }

  ChipConfig copyWith({
    ChipThemeData? theme,
    IconThemeData? iconTheme,
    Color? surfaceTintColor,
    Color? deleteIconColor,
    Clip? clipBehaviour,
    VisualDensity? visualDensity,
    MaterialTapTargetSize? materialTapTargetSize,
    bool? autofocus,
    IconData? defaultDeleteIcon,
  }) {
    return ChipConfig(
      theme: theme ?? this.theme,
      clipBehaviour: clipBehaviour ?? this.clipBehaviour,
      visualDensity: visualDensity ?? this.visualDensity,
      materialTapTargetSize:
          materialTapTargetSize ?? this.materialTapTargetSize,
      autofocus: autofocus ?? this.autofocus,
      iconTheme: iconTheme ?? this.iconTheme,
      surfaceTintColor: surfaceTintColor ?? this.surfaceTintColor,
      deleteIconColor: deleteIconColor ?? this.deleteIconColor,
      defaultDeleteIcon: defaultDeleteIcon ?? this.defaultDeleteIcon,
    );
  }
}

// Copied from ThemeDecoder with minor tweaks,
// as some the field were forced to be non-null.
ChipThemeData? _decodeChipThemeData(dynamic value) {
  ChipThemeData? result;

  if (value is ChipThemeData) {
    result = value;
  } else if (value != null) {
    result = ChipThemeData(
      backgroundColor: ThemeDecoder.decodeColor(
        value['backgroundColor'],
        validate: false,
      ),
      brightness: ThemeDecoder.decodeBrightness(
        value['brightness'],
        validate: false,
      ),
      checkmarkColor: ThemeDecoder.decodeColor(
        value['checkmarkColor'],
        validate: false,
      ),
      deleteIconColor: ThemeDecoder.decodeColor(
        value['deleteIconColor'],
        validate: false,
      ),
      disabledColor: ThemeDecoder.decodeColor(
        value['disabledColor'],
        validate: false,
      ),
      elevation: JsonClass.parseDouble(value['elevation']),
      labelPadding: ThemeDecoder.decodeEdgeInsetsGeometry(
        value['labelPadding'],
        validate: false,
      ),
      labelStyle: ThemeDecoder.decodeTextStyle(
        value['labelStyle'],
        validate: false,
      ),
      padding: ThemeDecoder.decodeEdgeInsetsGeometry(
        value['padding'],
        validate: false,
      ),
      pressElevation: JsonClass.parseDouble(value['pressElevation']),
      secondaryLabelStyle: ThemeDecoder.decodeTextStyle(
        value['secondaryLabelStyle'],
        validate: false,
      ),
      secondarySelectedColor: ThemeDecoder.decodeColor(
        value['secondarySelectedColor'],
        validate: false,
      ),
      selectedColor: ThemeDecoder.decodeColor(
        value['selectedColor'],
        validate: false,
      ),
      shape: ThemeDecoder.decodeShapeBorder(
        value['shape'],
        validate: false,
      ) as OutlinedBorder?,
      side: ThemeDecoder.decodeBorderSide(value['side']),
      selectedShadowColor: ThemeDecoder.decodeColor(
        value['selectedShadowColor'],
        validate: false,
      ),
      shadowColor: ThemeDecoder.decodeColor(
        value['shadowColor'],
        validate: false,
      ),
      showCheckmark: value['showCheckmark'] == null
          ? null
          : JsonClass.parseBool(value['showCheckmark']),
    );
  }

  return result;
}
