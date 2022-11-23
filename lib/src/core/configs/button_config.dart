import 'package:acme_theme_provider/src/core/component_config.dart';
import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';

class ButtonConfig extends ComponentConfig {
  const ButtonConfig({
    required this.style,
    required this.clip,
    required this.buttonType,
  });

  final ButtonStyle? style;
  final Clip clip;
  final ButtonType buttonType;

  factory ButtonConfig.fromMap(Map<String, dynamic> map) {
    final type = map['buttonType'];
    final buttonType = ButtonType.values.firstWhere(
      (e) => e.value == type,
      orElse: () => ButtonType.unknown,
    );
    return ButtonConfig(
      style: ThemeDecoder.decodeButtonStyle(map['style']),
      clip: ThemeDecoder.decodeClip(map['clip']) ?? Clip.none,
      buttonType: buttonType,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'type': ComponentType.button.value,
      'style': ThemeEncoder.encodeButtonStyle(style),
      'clip': ThemeEncoder.encodeClip(clip),
      'buttonType': buttonType.value,
    };
  }

  ButtonConfig copyWith({
    ButtonStyle? style,
    Clip? clip,
    ButtonType? buttonType,
  }) {
    return ButtonConfig(
      style: style ?? this.style,
      clip: clip ?? this.clip,
      buttonType: buttonType ?? this.buttonType,
    );
  }
}

enum ButtonType {
  elevated('elevated'),
  outlined('outlined'),
  text('text'),
  unknown('unknown');

  const ButtonType(this.value);

  final String value;
}
