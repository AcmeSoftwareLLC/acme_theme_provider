import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';

import '../component_config.dart';

class DialogConfig extends ComponentConfig {
  const DialogConfig({
    required this.theme,
    required this.insetPadding,
    required this.clipBehavior,
  });

  final DialogTheme? theme;
  final EdgeInsetsGeometry? insetPadding;
  final Clip clipBehavior;

  factory DialogConfig.fromMap(Map<String, dynamic> map) {
    return DialogConfig(
      theme: ThemeDecoder.decodeDialogTheme(map['theme']),
      insetPadding: ThemeDecoder.decodeEdgeInsetsGeometry(map['insetPadding']),
      clipBehavior: ThemeDecoder.decodeClip(map['clipBehavior']) ?? Clip.none,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'type': ComponentType.dialog.value,
      'theme': ThemeEncoder.encodeDialogTheme(theme),
      'insetPadding':
          ThemeEncoder.encodeEdgeInsetsGeometry(insetPadding as EdgeInsets?),
      'clipBehavior': ThemeEncoder.encodeClip(clipBehavior),
    };
  }

  DialogConfig copyWith({
    DialogTheme? theme,
    EdgeInsetsGeometry? insetPadding,
    Clip? clipBehavior,
  }) {
    return DialogConfig(
      theme: theme ?? this.theme,
      insetPadding: insetPadding ?? this.insetPadding,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }
}
