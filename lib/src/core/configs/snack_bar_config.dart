import 'package:acme_theme/src/core/component_config.dart';
import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';

class SnackBarConfig extends ComponentConfig {
  const SnackBarConfig({
    required this.theme,
    required this.padding,
    required this.margin,
    required this.clip,
    required this.width,
  });

  final SnackBarThemeData? theme;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Clip clip;
  final double? width;

  factory SnackBarConfig.fromMap(Map<String, dynamic> map) {
    return SnackBarConfig(
      theme: ThemeDecoder.decodeSnackBarThemeData(map['theme']),
      padding: ThemeDecoder.decodeEdgeInsetsGeometry(map['padding']),
      margin: ThemeDecoder.decodeEdgeInsetsGeometry(map['margin']),
      clip: ThemeDecoder.decodeClip(map['clip']) ?? Clip.hardEdge,
      width: map['width'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'type': ComponentType.snackBar.value,
      'theme': ThemeEncoder.encodeSnackBarThemeData(theme),
      'padding': ThemeEncoder.encodeEdgeInsetsGeometry(padding as EdgeInsets?),
      'margin': ThemeEncoder.encodeEdgeInsetsGeometry(margin as EdgeInsets?),
      'clip': ThemeEncoder.encodeClip(clip),
      'width': width,
    };
  }

  SnackBarConfig copyWith({
    SnackBarThemeData? theme,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Clip? clip,
    double? width,
  }) {
    return SnackBarConfig(
      theme: theme ?? this.theme,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      clip: clip ?? this.clip,
      width: width ?? this.width,
    );
  }
}
