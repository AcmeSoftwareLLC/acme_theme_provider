// Copyright (c) 2022. Acme Software LLC. All rights reserved.

import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';

/// Signature to create a [CustomColorsConverter] based on custom colors..
typedef CustomColorsConverterCreator<T extends Object>
    = CustomColorsConverter<T> Function(Map<String, CustomColor>);

///
abstract class CustomColorsConverter<T extends Object> {
  const CustomColorsConverter(Map<String, CustomColor> colors)
      : _colors = colors;

  final Map<String, CustomColor> _colors;

  /// Converts the custom colors to a custom color object.
  T convert();

  /// Resolves the custom color from [key].
  CustomColor call(String key) {
    return _colors[key] ??
        CustomColor(
          name: 'default',
          color: Colors.black,
          onColor: Colors.black,
          colorContainer: Colors.black,
          onColorContainer: Colors.black,
        );
  }
}

/// Defines a custom color converter.
class MapCustomColorConverter
    extends CustomColorsConverter<Map<String, CustomColor>> {
  const MapCustomColorConverter(super.colors);

  @override
  Map<String, CustomColor> convert() => _colors;
}

/// The CustomColors theme  extension allows you to define custom colors for your product
/// and attach it to the [ThemeData.extensions] property.
class CustomColors<T extends Object> extends ThemeExtension<CustomColors<T>> {
  /// Creates a new instance of the [CustomColors] theme extension.
  CustomColors({
    required this.converter,
    required Map<String, CustomColor> colors,
  }) : _colors = colors;

  final CustomColorsConverterCreator<T> converter;
  final Map<String, CustomColor> _colors;

  @override
  ThemeExtension<CustomColors<T>> copyWith({
    MapEntry<String, CustomColor>? color,
  }) {
    if (color == null) return this;

    final colors = Map.of(_colors);
    colors[color.key] = color.value;

    return CustomColors(colors: colors, converter: converter);
  }

  @override
  ThemeExtension<CustomColors<T>> lerp(
    ThemeExtension<CustomColors>? other,
    double t,
  ) {
    if (other is! CustomColors) return this;

    final currentKeys = _colors.keys.toSet();
    final otherKeys = other._colors.keys.toSet();
    final commonKeys = currentKeys.intersection(otherKeys);

    return CustomColors(
      colors: {
        for (final key in commonKeys)
          key: _colors[key]!.lerp(other._colors[key]!, t)
      },
      converter: converter,
    );
  }

  T call() => converter(_colors).convert();

  /// Returns the [CustomColor]s.
  Map<String, CustomColor> get colors => Map.unmodifiable(_colors);

  /// Returns the [CustomColor] for the given [name].
  CustomColor getColor(String name) => _colors[name]!;

  /// Returns the [CustomColor] resolved through the [context].
  static T of<T extends Object>(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors<T>>();

    assert(colors != null);
    return colors!();
  }
}

/// A custom color definition.
class CustomColor {
  /// Creates a custom color definition.
  CustomColor({
    required this.name,
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  /// The name of the color.
  final String name;

  /// The main color.
  final Color color;

  /// A color that's clearly legible when drawn on [color].
  final Color onColor;

  /// A color used for elements needing less emphasis than the [color].
  final Color colorContainer;

  /// A color that's clearly legible when drawn on [colorContainer].
  final Color onColorContainer;

  /// Creates an instance of [CustomColor] from the [map].
  factory CustomColor.fromMap(String name, Map<String, dynamic> map) {
    return CustomColor(
      name: name,
      color: _decodeColor(map['default']),
      onColor: _decodeColor(map['on']),
      colorContainer: _decodeColor(map['container']),
      onColorContainer: _decodeColor(map['onContainer']),
    );
  }

  /// Creates a copy of this [CustomColor] with the given fields replaced with the new values.
  CustomColor copyWith({
    Color? color,
    Color? onColor,
    Color? colorContainer,
    Color? onColorContainer,
  }) {
    return CustomColor(
      name: name,
      color: color ?? this.color,
      onColor: onColor ?? this.onColor,
      colorContainer: colorContainer ?? this.colorContainer,
      onColorContainer: onColorContainer ?? this.onColorContainer,
    );
  }

  /// Linearly interpolate between two [CustomColor]s.
  CustomColor lerp(CustomColor other, double t) {
    return CustomColor(
      name: name,
      color: Color.lerp(color, other.color, t)!,
      onColor: Color.lerp(onColor, other.onColor, t)!,
      colorContainer: Color.lerp(colorContainer, other.colorContainer, t)!,
      onColorContainer: Color.lerp(
        onColorContainer,
        other.onColorContainer,
        t,
      )!,
    );
  }

  /// Creates a [Map] representation of this [CustomColor].
  Map<String, String> toMap() {
    return {
      'default': ThemeEncoder.encodeColor(color)!,
      'on': ThemeEncoder.encodeColor(onColor)!,
      'container': ThemeEncoder.encodeColor(colorContainer)!,
      'onContainer': ThemeEncoder.encodeColor(onColorContainer)!,
    };
  }
}

Color _decodeColor(String colorHex) {
  return ThemeDecoder.decodeColor(colorHex) ?? Colors.transparent;
}
