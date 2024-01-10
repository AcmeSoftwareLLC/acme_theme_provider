// Copyright (c) 2022. Acme Software LLC. All rights reserved.

import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';

import '../component_config.dart';

class DropdownMenuEntryConfig extends ComponentConfig {
  const DropdownMenuEntryConfig({
    required this.style,
    this.defaultLeadingIcon,
    this.defaultTrailingIcon,
  });

  final ButtonStyle? style;
  final IconData? defaultLeadingIcon;
  final IconData? defaultTrailingIcon;

  factory DropdownMenuEntryConfig.fromMap(Map<String, dynamic> map) {
    return DropdownMenuEntryConfig(
      style:
          ThemeDecoder.decodeButtonStyle(map['style']) ?? const ButtonStyle(),
      defaultLeadingIcon:
          ThemeDecoder.decodeIconData(map['defaultLeadingIcon']),
      defaultTrailingIcon:
          ThemeDecoder.decodeIconData(map['defaultTrailingIcon']),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'style': ThemeEncoder.encodeButtonStyle(style),
      'defaultLeadingIcon': ThemeEncoder.encodeIconData(defaultLeadingIcon),
      'defaultTrailingIcon': ThemeEncoder.encodeIconData(defaultTrailingIcon),
    };
  }

  DropdownMenuEntryConfig copyWith({
    ButtonStyle? style,
    IconData? defaultLeadingIcon,
    IconData? defaultTrailingIcon,
  }) {
    return DropdownMenuEntryConfig(
      style: style ?? this.style,
      defaultLeadingIcon: defaultLeadingIcon ?? this.defaultLeadingIcon,
      defaultTrailingIcon: defaultTrailingIcon ?? this.defaultTrailingIcon,
    );
  }
}
