import 'package:acme_theme_provider/src/core/component_config.dart';
import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';

class DropdownButtonConfig extends ComponentConfig {
  const DropdownButtonConfig({
    required this.style,
    required this.elevation,
    required this.isDense,
    required this.isExpanded,
    required this.autofocus,
    required this.borderRadius,
    required this.dropdownColor,
    required this.enabledFeedback,
    required this.focusColor,
    required this.iconDisabledColor,
    required this.iconEnabledColor,
    required this.iconSize,
    required this.itemHeight,
    required this.menuMaxHeight,
  });

  final TextStyle? style;
  final bool autofocus;
  final int elevation;
  final bool isDense;
  final bool isExpanded;
  final BorderRadius? borderRadius;
  final Color? dropdownColor;
  final bool? enabledFeedback;
  final Color? focusColor;
  final Color? iconDisabledColor;
  final Color? iconEnabledColor;
  final double iconSize;
  final double? itemHeight;
  final double? menuMaxHeight;

  factory DropdownButtonConfig.fromMap(Map<String, dynamic> map) {
    return DropdownButtonConfig(
      style: ThemeDecoder.decodeTextStyle(map['style']),
      iconSize: map['iconSize'] ?? 24.0,
      isExpanded: map['isExpanded'] ?? false,
      autofocus: map['autofocus'] ?? false,
      isDense: map['isDense'] ?? false,
      elevation: map['elevation'] ?? 8,
      itemHeight: map['itemHeight'],
      menuMaxHeight: map['menuMaxHeight'],
      enabledFeedback: map['enabledFeedback'],
      borderRadius: ThemeDecoder.decodeBorderRadius(map['borderRadius']),
      dropdownColor: ThemeDecoder.decodeColor(map['dropdownColor']),
      focusColor: ThemeDecoder.decodeColor(map['focusColor']),
      iconDisabledColor: ThemeDecoder.decodeColor(map['iconDisabledColor']),
      iconEnabledColor: ThemeDecoder.decodeColor(map['iconEnabledColor']),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'type': ComponentType.button.value,
      'style': ThemeEncoder.encodeTextStyle(style),
      'iconSize': iconSize,
      'isExpanded': isExpanded,
      'autofocus': autofocus,
      'isDense': isDense,
      'elevation': elevation,
      'itemHeight': itemHeight,
      'menuMaxHeight': menuMaxHeight,
      'enabledFeedback': enabledFeedback,
      'borderRadius': ThemeEncoder.encodeBorderRadius(borderRadius),
      'dropdownColor': ThemeEncoder.encodeColor(dropdownColor),
      'focusColor': ThemeEncoder.encodeColor(focusColor),
      'iconDisabledColor': ThemeEncoder.encodeColor(iconDisabledColor),
      'iconEnabledColor': ThemeEncoder.encodeColor(iconEnabledColor),
    };
  }

  DropdownButtonConfig copyWith({
    TextStyle? style,
    bool? autofocus,
    int? elevation,
    bool? isDense,
    bool? isExpanded,
    BorderRadius? borderRadius,
    Color? dropdownColor,
    bool? enabledFeedback,
    Color? focusColor,
    Color? iconDisabledColor,
    Color? iconEnabledColor,
    double? iconSize,
    double? itemHeight,
    double? menuMaxHeight,
  }) {
    return DropdownButtonConfig(
      style: style ?? this.style,
      iconSize: iconSize ?? this.iconSize,
      isExpanded: isExpanded ?? this.isExpanded,
      autofocus: autofocus ?? this.autofocus,
      isDense: isDense ?? this.isDense,
      elevation: elevation ?? this.elevation,
      itemHeight: itemHeight ?? this.itemHeight,
      menuMaxHeight: menuMaxHeight ?? this.menuMaxHeight,
      enabledFeedback: enabledFeedback ?? this.enabledFeedback,
      borderRadius: borderRadius ?? this.borderRadius,
      dropdownColor: dropdownColor ?? this.dropdownColor,
      focusColor: focusColor ?? this.focusColor,
      iconDisabledColor: iconDisabledColor ?? this.iconDisabledColor,
      iconEnabledColor: iconEnabledColor ?? this.iconEnabledColor,
    );
  }
}
