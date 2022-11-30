import 'package:acme_theme_provider/src/core/component_config.dart';
import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';

class ChipConfig extends ComponentConfig {
  const ChipConfig({
    required this.theme,
    required this.iconTheme,
    required this.surfaceTintColor,
    required this.deleteIconColor,
    required this.clipBehaviour,
    required this.visualDensity,
    required this.materialTapTargetSize,
    required this.autofocus,
  });

  final ChipThemeData? theme;
  final IconThemeData? iconTheme;
  final Color? surfaceTintColor;
  final Color? deleteIconColor;
  final Clip clipBehaviour;
  final VisualDensity? visualDensity;
  final MaterialTapTargetSize? materialTapTargetSize;
  final bool autofocus;

  factory ChipConfig.fromMap(Map<String, dynamic> map) {
    return ChipConfig(
      theme: ThemeDecoder.decodeChipThemeData(map['theme']),
      iconTheme: ThemeDecoder.decodeIconThemeData(map['iconTheme']),
      surfaceTintColor: ThemeDecoder.decodeColor(map['surfaceTintColor']),
      deleteIconColor: ThemeDecoder.decodeColor(map['deleteIconColor']),
      clipBehaviour: ThemeDecoder.decodeClip(map['clipBehaviour']) ?? Clip.none,
      visualDensity: ThemeDecoder.decodeVisualDensity(map['visualDensity']),
      materialTapTargetSize: ThemeDecoder.decodeMaterialTapTargetSize(
          map['materialTapTargetSize']),
      autofocus: map['autofocus'] ?? false,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'type': ComponentType.chip.value,
      'theme': ThemeEncoder.encodeChipThemeData(theme),
      'iconTheme': ThemeEncoder.encodeIconThemeData(iconTheme),
      'surfaceTintColor': ThemeEncoder.encodeColor(surfaceTintColor),
      'deleteIconColor': ThemeEncoder.encodeColor(deleteIconColor),
      'clipBehaviour': ThemeEncoder.encodeClip(clipBehaviour),
      'visualDensity': ThemeEncoder.encodeVisualDensity(visualDensity),
      'materialTapTargetSize':
          ThemeEncoder.encodeMaterialTapTargetSize(materialTapTargetSize),
      'autofocus': autofocus,
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
      iconTheme: iconTheme ?? this.iconTheme,
      surfaceTintColor: surfaceTintColor ?? this.surfaceTintColor,
      deleteIconColor: deleteIconColor ?? this.deleteIconColor,
      clipBehaviour: clipBehaviour ?? this.clipBehaviour,
      visualDensity: visualDensity ?? this.visualDensity,
      materialTapTargetSize:
          materialTapTargetSize ?? this.materialTapTargetSize,
      autofocus: autofocus ?? this.autofocus,
    );
  }
}
