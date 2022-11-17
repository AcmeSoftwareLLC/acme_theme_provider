import 'package:acme_theme_provider/src/core/component_config.dart';
import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';

class AppBarConfig extends ComponentConfig {
  const AppBarConfig({required super.name, required this.theme});

  final AppBarTheme theme;

  factory AppBarConfig.from(Map<String, dynamic> map) {
    return AppBarConfig(
      name: map['name'],
      theme: ThemeDecoder.decodeAppBarTheme(map['theme'])!,
    );
  }
}
