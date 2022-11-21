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

  factory AppBarConfig.fromMap(Map<String, dynamic> map) {
    return AppBarConfig(
      theme: ThemeDecoder.decodeAppBarTheme(map['theme'])!,
      divider: map.containsKey('divider')
          ? DividerAppBarConfig.fromMap(map['divider'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'theme': ThemeEncoder.encodeAppBarTheme(theme),
      'divider': divider?.toMap(),
    };
  }

  AppBarConfig copyWith({
    AppBarTheme? theme,
    DividerAppBarConfig? divider,
  }) {
    return AppBarConfig(
      theme: theme ?? this.theme,
      divider: divider ?? this.divider,
    );
  }
}

class DividerAppBarConfig extends ComponentConfig {
  DividerAppBarConfig({
    required this.color,
    required this.thickness,
  });

  final Color? color;
  final double? thickness;

  factory DividerAppBarConfig.fromMap(Map<String, dynamic> map) {
    return DividerAppBarConfig(
      color: ThemeDecoder.decodeColor(map['color']),
      thickness: map['thickness'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'color': ThemeEncoder.encodeColor(color),
      'thickness': thickness,
    };
  }

  DividerAppBarConfig copyWith({
    Color? color,
    double? thickness,
  }) {
    return DividerAppBarConfig(
      color: color ?? this.color,
      thickness: thickness ?? this.thickness,
    );
  }
}
