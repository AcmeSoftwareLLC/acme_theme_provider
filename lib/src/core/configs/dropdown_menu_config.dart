// Copyright (c) 2022. Acme Software LLC. All rights reserved.

import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';

import '../component_config.dart';
import 'dropdown_menu_entry_config.dart';

class DropdownMenuConfig extends ComponentConfig {
  const DropdownMenuConfig({
    required this.width,
    required this.menuHeight,
    required this.textStyle,
    required this.inputDecorationTheme,
    required this.menuStyle,
    required this.requestFocusOnTap,
    required this.expandedInsets,
    this.defaultLeadingIcon,
    this.defaultTrailingIcon,
    this.defaultSelectedIcon,
    this.menuEntryConfig,
  });

  final double? width;
  final double? menuHeight;
  final TextStyle? textStyle;
  final InputDecorationTheme? inputDecorationTheme;
  final MenuStyle? menuStyle;
  final bool? requestFocusOnTap;
  final EdgeInsets? expandedInsets;
  final IconData? defaultLeadingIcon;
  final IconData? defaultTrailingIcon;
  final IconData? defaultSelectedIcon;
  final DropdownMenuEntryConfig? menuEntryConfig;

  factory DropdownMenuConfig.fromMap(Map<String, dynamic> map) {
    return DropdownMenuConfig(
      width: map['width'] ?? 200.0,
      menuHeight: map['menuHeight'] ?? 100.0,
      textStyle: ThemeDecoder.decodeTextStyle(
        map['textStyle'],
      ),
      inputDecorationTheme: ThemeDecoder.decodeInputDecorationTheme(
        map['inputDecorationTheme'],
      ),
      menuStyle: ThemeDecoder.decodeMenuStyle(
        map['menuStyle'],
      ),
      requestFocusOnTap: map['requestFocusOnTap'],
      expandedInsets: ThemeDecoder.decodeEdgeInsets(
        map['expandedInsets'],
      ),
      defaultLeadingIcon:
          ThemeDecoder.decodeIconData(map['defaultLeadingIcon']),
      defaultTrailingIcon:
          ThemeDecoder.decodeIconData(map['defaultTrailingIcon']),
      defaultSelectedIcon:
          ThemeDecoder.decodeIconData(map['defaultSelectedIcon']),
      menuEntryConfig:
          DropdownMenuEntryConfig.fromMap(map['menuEntryConfig'] ?? {}),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'type': ComponentType.dropDown.value,
      'width': width,
      'menuHeight': menuHeight,
      'textStyle': ThemeEncoder.encodeTextStyle(
        textStyle,
      ),
      'inputDecorationTheme': ThemeEncoder.encodeInputDecorationTheme(
        inputDecorationTheme,
      ),
      'menuStyle': ThemeEncoder.encodeMenuStyle(
        menuStyle,
      ),
      'requestFocusOnTap': requestFocusOnTap,
      'expandedInsets': ThemeEncoder.encodeEdgeInsets(
        expandedInsets,
      ),
      'defaultLeadingIcon': ThemeEncoder.encodeIconData(defaultLeadingIcon),
      'defaultTrailingIcon': ThemeEncoder.encodeIconData(defaultTrailingIcon),
      'defaultSelectedIcon': ThemeEncoder.encodeIconData(defaultSelectedIcon),
      'menuEntryConfig': menuEntryConfig?.toMap() ?? {},
    };
  }

  DropdownMenuConfig copyWith({
    double? width,
    double? menuHeight,
    TextStyle? textStyle,
    InputDecorationTheme? inputDecorationTheme,
    MenuStyle? menuStyle,
    bool? requestFocusOnTap,
    EdgeInsets? expandedInsets,
    IconData? defaultLeadingIcon,
    IconData? defaultTrailingIcon,
    IconData? defaultSelectedIcon,
    DropdownMenuEntryConfig? menuEntryConfig,
  }) {
    return DropdownMenuConfig(
      width: width ?? this.width,
      menuHeight: menuHeight ?? this.menuHeight,
      textStyle: textStyle ?? this.textStyle,
      inputDecorationTheme: inputDecorationTheme ?? this.inputDecorationTheme,
      menuStyle: menuStyle ?? this.menuStyle,
      requestFocusOnTap: requestFocusOnTap ?? this.requestFocusOnTap,
      expandedInsets: expandedInsets ?? this.expandedInsets,
      defaultLeadingIcon: defaultLeadingIcon ?? this.defaultLeadingIcon,
      defaultTrailingIcon: defaultTrailingIcon ?? this.defaultTrailingIcon,
      defaultSelectedIcon: defaultSelectedIcon ?? this.defaultSelectedIcon,
      menuEntryConfig: menuEntryConfig ?? this.menuEntryConfig,
    );
  }

  DropdownMenuConfig clearDefaultLeadingIcon() {
    return DropdownMenuConfig(
      width: this.width,
      menuHeight: this.menuHeight,
      textStyle: this.textStyle,
      inputDecorationTheme: this.inputDecorationTheme,
      menuStyle: this.menuStyle,
      requestFocusOnTap: this.requestFocusOnTap,
      expandedInsets: this.expandedInsets,
      defaultLeadingIcon: null,
      defaultTrailingIcon: this.defaultTrailingIcon,
      defaultSelectedIcon: this.defaultSelectedIcon,
      menuEntryConfig: this.menuEntryConfig,
    );
  }

  DropdownMenuConfig clearDefaultTrailingIcon() {
    return DropdownMenuConfig(
      width: this.width,
      menuHeight: this.menuHeight,
      textStyle: this.textStyle,
      inputDecorationTheme: this.inputDecorationTheme,
      menuStyle: this.menuStyle,
      requestFocusOnTap: this.requestFocusOnTap,
      expandedInsets: this.expandedInsets,
      defaultLeadingIcon: this.defaultLeadingIcon,
      defaultTrailingIcon: null,
      defaultSelectedIcon: this.defaultSelectedIcon,
      menuEntryConfig: this.menuEntryConfig,
    );
  }

  DropdownMenuConfig clearDefaultSelectedIcon() {
    return DropdownMenuConfig(
      width: this.width,
      menuHeight: this.menuHeight,
      textStyle: this.textStyle,
      inputDecorationTheme: this.inputDecorationTheme,
      menuStyle: this.menuStyle,
      requestFocusOnTap: this.requestFocusOnTap,
      expandedInsets: this.expandedInsets,
      defaultLeadingIcon: this.defaultLeadingIcon,
      defaultTrailingIcon: this.defaultTrailingIcon,
      defaultSelectedIcon: null,
      menuEntryConfig: this.menuEntryConfig,
    );
  }
}
