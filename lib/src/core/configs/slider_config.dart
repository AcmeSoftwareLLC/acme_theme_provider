import 'package:acme_theme_provider/src/core/component_config.dart';
import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';

class SliderConfig extends ComponentConfig {
  const SliderConfig({
    required this.theme,
    required this.autofocus,
    required this.activeColor,
    required this.inactiveColor,
  });

  final SliderThemeData? theme;
  final bool autofocus;
  final Color? activeColor;
  final Color? inactiveColor;

  factory SliderConfig.fromMap(Map<String, dynamic> map) {
    return SliderConfig(
      theme: ThemeDecoder.decodeSliderThemeData(map['theme']),
      autofocus: map['autofocus'] ?? false,
      activeColor: ThemeDecoder.decodeColor(map['activeColor']),
      inactiveColor: ThemeDecoder.decodeColor(map['inactiveColor']),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'type': ComponentType.slider.value,
      'theme': ThemeEncoder.encodeSliderThemeData(theme),
      'autofocus': autofocus,
      'activeColor': ThemeEncoder.encodeColor(activeColor),
      'inactiveColor': ThemeEncoder.encodeColor(inactiveColor),
    };
  }

  SliderConfig copyWith({
    SliderThemeData? theme,
    bool? autofocus,
    Color? activeColor,
    Color? inactiveColor,
  }) {
    return SliderConfig(
      theme: theme ?? this.theme,
      autofocus: autofocus ?? this.autofocus,
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
    );
  }
}
