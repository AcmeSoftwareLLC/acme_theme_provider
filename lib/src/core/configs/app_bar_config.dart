import 'package:acme_theme_provider/src/core/component_config.dart';
import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';

class AppBarConfig extends ComponentConfig {
  const AppBarConfig({
    required this.theme,
    required this.divider,
  });

  final AppBarTheme theme;
  final DividerAppBarConfig? divider;

  factory AppBarConfig.from(Map<String, dynamic> map) {
    return AppBarConfig(
      theme: ThemeDecoder.decodeAppBarTheme(map['theme'])!,
      divider: map.containsKey('divider')
          ? DividerAppBarConfig.from(map['divider'])
          : null,
    );
  }
}

class DividerAppBarConfig {
  DividerAppBarConfig({
    required this.color,
    required this.thickness,
  });

  final Color? color;
  final double? thickness;

  factory DividerAppBarConfig.from(Map<String, dynamic> map) {
    return DividerAppBarConfig(
      color: ThemeDecoder.decodeColor(map['color']),
      thickness: map['thickness'],
    );
  }
}
