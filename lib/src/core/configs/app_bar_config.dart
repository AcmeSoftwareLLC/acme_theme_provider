// Copyright (c) 2022. Acme Software LLC. All rights reserved.

import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';

import '../component_config.dart';

class AppBarConfig extends ComponentConfig {
  const AppBarConfig({
    required this.theme,
    required this.divider,
    this.toolbarOpacity = 1,
    this.bottomOpacity = 1,
    required this.leadingWidth,
  });

  final AppBarTheme? theme;
  final DividerAppBarConfig? divider;
  final double toolbarOpacity;
  final double bottomOpacity;
  final double? leadingWidth;

  factory AppBarConfig.fromMap(Map<String, dynamic> map) {
    final divider = map['divider'];
    final leadingWidth = map['leadingWidth'];
    final toolbarOpacity = map['toolbarOpacity'];
    final bottomOpacity = map['bottomOpacity'];

    return AppBarConfig(
      theme: ThemeDecoder.decodeAppBarTheme(map['theme']),
      divider: divider == null ? null : DividerAppBarConfig.fromMap(divider),
      toolbarOpacity: toolbarOpacity ?? 1,
      bottomOpacity: bottomOpacity ?? 1,
      leadingWidth: leadingWidth ?? 56,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'type': ComponentType.appBar.value,
      'theme': ThemeEncoder.encodeAppBarTheme(theme),
      'divider': divider?.toMap(),
      'toolbarOpacity': toolbarOpacity,
      'bottomOpacity': bottomOpacity,
      'leadingWidth': leadingWidth,
    };
  }

  AppBarConfig copyWith({
    AppBarTheme? theme,
    DividerAppBarConfig? divider,
    double? toolbarOpacity,
    double? bottomOpacity,
    double? leadingWidth,
  }) {
    return AppBarConfig(
      theme: theme ?? this.theme,
      divider: divider ?? this.divider,
      toolbarOpacity: toolbarOpacity ?? this.toolbarOpacity,
      bottomOpacity: bottomOpacity ?? this.bottomOpacity,
      leadingWidth: leadingWidth ?? this.leadingWidth,
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
