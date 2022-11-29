import 'package:acme_theme_provider/src/core/component_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';

class SwitchConfig extends ComponentConfig {
  const SwitchConfig({
    required this.theme,
    required this.focusColor,
    required this.activeColor,
    required this.activeTrackColor,
    required this.hoverColor,
    required this.inactiveThumbColor,
    required this.inactiveTrackColor,
    required this.autofocus,
    required this.adaptive,
    required this.dragStartBehavior,
  });

  final SwitchThemeData? theme;
  final Color? focusColor;
  final Color? activeColor;
  final Color? activeTrackColor;
  final Color? hoverColor;
  final Color? inactiveThumbColor;
  final Color? inactiveTrackColor;
  final bool autofocus;
  final bool adaptive;
  final DragStartBehavior dragStartBehavior;

  factory SwitchConfig.fromMap(Map<String, dynamic> map) {
    return SwitchConfig(
      theme: ThemeDecoder.decodeSwitchThemeData(map['theme']),
      focusColor: ThemeDecoder.decodeColor(map['focusColor']),
      activeColor: ThemeDecoder.decodeColor(map['activeColor']),
      activeTrackColor: ThemeDecoder.decodeColor(map['activeTrackColor']),
      hoverColor: ThemeDecoder.decodeColor(map['hoverColor']),
      inactiveThumbColor: ThemeDecoder.decodeColor(map['inactiveThumbColor']),
      inactiveTrackColor: ThemeDecoder.decodeColor(map['inactiveTrackColor']),
      dragStartBehavior:
          ThemeDecoder.decodeDragStartBehavior(map['dragStartBehavior']) ??
              DragStartBehavior.start,
      autofocus: map['autofocus'] ?? false,
      adaptive: map['adaptive'] ?? false,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'type': ComponentType.switchToggle.value,
      'theme': ThemeEncoder.encodeSwitchThemeData(theme),
      'focusColor': ThemeEncoder.encodeColor(focusColor),
      'activeColor': ThemeEncoder.encodeColor(activeColor),
      'activeTrackColor': ThemeEncoder.encodeColor(activeTrackColor),
      'hoverColor': ThemeEncoder.encodeColor(hoverColor),
      'inactiveThumbColor': ThemeEncoder.encodeColor(inactiveThumbColor),
      'inactiveTrackColor': ThemeEncoder.encodeColor(inactiveTrackColor),
      'dragStartBehavior':
          ThemeEncoder.encodeDragStartBehavior(dragStartBehavior),
      'autofocus': autofocus,
      'adaptive': adaptive,
    };
  }

  SwitchConfig copyWith({
    final SwitchThemeData? theme,
    final Color? focusColor,
    final Color? activeColor,
    final Color? activeTrackColor,
    final Color? hoverColor,
    final Color? inactiveThumbColor,
    final Color? inactiveTrackColor,
    final bool? autofocus,
    final bool? adaptive,
    final DragStartBehavior? dragStartBehavior,
  }) {
    return SwitchConfig(
      theme: theme ?? this.theme,
      focusColor: focusColor ?? this.focusColor,
      activeColor: activeColor ?? this.activeColor,
      activeTrackColor: activeTrackColor ?? this.activeTrackColor,
      hoverColor: hoverColor ?? this.hoverColor,
      inactiveThumbColor: inactiveThumbColor ?? this.inactiveThumbColor,
      inactiveTrackColor: inactiveTrackColor ?? this.inactiveTrackColor,
      autofocus: autofocus ?? this.autofocus,
      adaptive: adaptive ?? this.adaptive,
      dragStartBehavior: dragStartBehavior ?? this.dragStartBehavior,
    );
  }
}
