import 'package:acme_theme_provider/src/core/component_config.dart';
import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';

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
  });

  final ChipThemeData? theme;

  final Clip clipBehaviour;
  final VisualDensity? visualDensity;
  final MaterialTapTargetSize? materialTapTargetSize;
  final bool autofocus;
  final IconThemeData? iconTheme;
  final Color? surfaceTintColor;
  final Color? deleteIconColor;

  factory ChipConfig.fromMap(Map<String, dynamic> map) {
    if (map['theme'] != null) {
      if (map['theme']['backgroundColor'] == null) {
        map['theme']['backgroundColor'] = '#FFFFFF';
      }
      if (map['theme']['brightness'] == null) {
        map['theme']['brightness'] = 'light';
      }
      if (map['theme']['disabledColor'] == null) {
        map['theme']['disabledColor'] = '#FFFFFF';
      }
      if (map['theme']['labelStyle'] == null) {
        map['theme']['labelStyle'] = {
          'color': '#FFFFFF',
        };
      }
      if (map['theme']['padding'] == null) {
        map['theme']['padding'] = {
          'bottom': 8.0,
          'left': 8.0,
          'right': 8.0,
          'top': 8.0
        };
      }
      if (map['theme']['secondaryLabelStyle'] == null) {
        map['theme']['secondaryLabelStyle'] = {
          'color': '#FFFFFF',
        };
      }
      if (map['theme']['secondarySelectedColor'] == null) {
        map['theme']['secondarySelectedColor'] = '#FFFFFF';
      }
      if (map['theme']['selectedColor'] == null) {
        map['theme']['selectedColor'] = '#FFFFFF';
      }
    }
    return ChipConfig(
      theme: ThemeDecoder.decodeChipThemeData(map['theme']),
      clipBehaviour: ThemeDecoder.decodeClip(map['clipBehaviour']) ?? Clip.none,
      visualDensity: ThemeDecoder.decodeVisualDensity(map['visualDensity']),
      materialTapTargetSize: ThemeDecoder.decodeMaterialTapTargetSize(
          map['materialTapTargetSize']),
      autofocus: map['autofocus'] ?? false,
      iconTheme: ThemeDecoder.decodeIconThemeData(map['iconTheme']),
      surfaceTintColor: ThemeDecoder.decodeColor(map['surfaceTintColor']),
      deleteIconColor: ThemeDecoder.decodeColor(map['deleteIconColor']),
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
    );
  }
}
