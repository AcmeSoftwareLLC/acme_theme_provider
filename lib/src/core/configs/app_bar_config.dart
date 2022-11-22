import 'package:acme_theme_provider/src/core/component_config.dart';
import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';

class AppBarConfig extends ComponentConfig {
  const AppBarConfig({
    required this.theme,
    required this.divider,
    required this.elevation,
    required this.scrolledUnderElevation,
    required this.titleSpacing,
    this.toolbarOpacity = 1,
    this.bottomOpacity = 1,
    required this.toolbarHeight,
    required this.leadingWidth,
  });

  final AppBarTheme? theme;
  final DividerAppBarConfig? divider;
  final double? elevation;
  final double? scrolledUnderElevation;
  final double? titleSpacing;
  final double toolbarOpacity;
  final double bottomOpacity;
  final double? toolbarHeight;
  final double? leadingWidth;

  factory AppBarConfig.fromMap(Map<String, dynamic> map) {
    final divider = map['divider'];
    final elevation = map['elevation'];
    final scrolledUnderElevation = map['scrolledUnderElevation'];
    final titleSpacing = map['titleSpacing'];
    final toolbarHeight = map['toolbarHeight'];
    final leadingWidth = map['leadingWidth'];
    final toolbarOpacity = map['toolbarOpacity'];
    final bottomOpacity = map['bottomOpacity'];

    return AppBarConfig(
      theme: ThemeDecoder.decodeAppBarTheme(map['theme']),
      divider: divider == null ? null : DividerAppBarConfig.fromMap(divider),
      elevation: elevation ?? null,
      scrolledUnderElevation: scrolledUnderElevation ?? null,
      titleSpacing: titleSpacing ?? null,
      toolbarOpacity: toolbarOpacity ?? 1,
      bottomOpacity: bottomOpacity ?? 1,
      toolbarHeight: toolbarHeight ?? null,
      leadingWidth: leadingWidth ?? null,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'type': ComponentType.appBar.value,
      'theme': ThemeEncoder.encodeAppBarTheme(theme),
      'divider': divider?.toMap(),
      'elevation': elevation,
      'scrolledUnderElevation': scrolledUnderElevation,
      'titleSpacing': titleSpacing,
      'toolbarOpacity': toolbarOpacity,
      'bottomOpacity': bottomOpacity,
      'toolbarHeight': toolbarHeight,
      'leadingWidth': leadingWidth,
    };
  }

  AppBarConfig copyWith({
    AppBarTheme? theme,
    DividerAppBarConfig? divider,
    double? elevation,
    double? scrolledUnderElevation,
    Color? shadowColor,
    double? titleSpacing,
    double? toolbarOpacity,
    double? bottomOpacity,
    double? toolbarHeight,
    double? leadingWidth,
  }) {
    return AppBarConfig(
      theme: theme ?? this.theme,
      divider: divider ?? this.divider,
      elevation: elevation ?? this.elevation,
      scrolledUnderElevation:
          scrolledUnderElevation ?? this.scrolledUnderElevation,
      titleSpacing: titleSpacing ?? this.titleSpacing,
      toolbarOpacity: toolbarOpacity ?? this.toolbarOpacity,
      bottomOpacity: bottomOpacity ?? this.bottomOpacity,
      toolbarHeight: toolbarHeight ?? this.toolbarHeight,
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
