import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';

typedef CustomColorsConverterCreator<T extends Object>
    = CustomColorsConverter<T> Function(Map<String, CustomColor>);

abstract class CustomColorsConverter<T extends Object> {
  const CustomColorsConverter(Map<String, CustomColor> colors)
      : _colors = colors;

  final Map<String, CustomColor> _colors;

  T convert();

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

class MapCustomColorConverter
    extends CustomColorsConverter<Map<String, CustomColor>> {
  const MapCustomColorConverter(super.colors);

  @override
  Map<String, CustomColor> convert() => _colors;
}

class CustomColors<T extends Object> extends ThemeExtension<CustomColors<T>> {
  CustomColors({
    required this.converter,
    required Map<String, CustomColor> colors,
  }) : _colors = colors;

  final CustomColorsConverterCreator<T> converter;
  final Map<String, CustomColor> _colors;

  @override
  ThemeExtension<CustomColors<T>> copyWith(
      {MapEntry<String, CustomColor>? color}) {
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

    return CustomColors(
      colors: _colors.map((k, v) => MapEntry(k, v.lerp(other._colors[k]!, t))),
      converter: converter,
    );
  }

  T call() => converter(_colors).convert();

  Map<String, CustomColor> get colors => Map.unmodifiable(_colors);

  CustomColor getColor(String name) => _colors[name]!;

  static T of<T extends Object>(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors<T>>();

    assert(colors != null);
    return colors!();
  }
}

class CustomColor {
  CustomColor({
    required this.name,
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final String name;
  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;

  factory CustomColor.fromMap(String name, Map<String, dynamic> map) {
    return CustomColor(
      name: name,
      color: _decodeColor(map['default']),
      onColor: _decodeColor(map['on']),
      colorContainer: _decodeColor(map['container']),
      onColorContainer: _decodeColor(map['onContainer']),
    );
  }

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
