// Copyright (c) 2022. Acme Software LLC. All rights reserved.

import 'package:acme_theme/helpers/acme_color_decoder.dart';
import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';

import '../component_config.dart';

class CardConfig extends ComponentConfig {
  const CardConfig({
    required this.theme,
    required this.semanticContainer,
    required this.borderOnForeground,
  });

  final CardTheme? theme;
  final bool semanticContainer;
  final bool borderOnForeground;

  factory CardConfig.fromMap(Map<String, dynamic> map, ColorScheme colorScheme) {
    return CardConfig(
      theme: ThemeDecoder.decodeCardTheme( AcmeColorDecoder().cleanupColors(map['theme'], colorScheme,
          keys: ['color']),
          validate: false),
      semanticContainer: map['semanticContainer'] ?? true,
      borderOnForeground: map['borderOnForeground'] ?? true,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'type': ComponentType.card.value,
      'theme': ThemeEncoder.encodeCardTheme(theme),
      'semanticContainer': semanticContainer,
      'borderOnForeground': borderOnForeground,
    };
  }

  CardConfig copyWith({
    CardTheme? theme,
    bool? semanticContainer,
    bool? borderOnForeground,
  }) {
    return CardConfig(
      theme: theme ?? this.theme,
      semanticContainer: semanticContainer ?? this.semanticContainer,
      borderOnForeground: borderOnForeground ?? this.borderOnForeground,
    );
  }
}
