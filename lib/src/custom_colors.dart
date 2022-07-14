import 'package:flutter/material.dart';

typedef CustomColorsConverterCreator<T extends Object>
    = CustomColorsConverter<T> Function(Map<String, Color>);

abstract class CustomColorsConverter<T extends Object> {
  const CustomColorsConverter(Map<String, Color> colors) : _colors = colors;

  final Map<String, Color> _colors;

  T convert();

  Color call(String key) => _colors[key] ?? Colors.black;
}

class CustomColors<T extends Object> extends ThemeExtension<CustomColors<T>> {
  CustomColors({
    required this.converter,
    required Map<String, Color> colors,
  }) : _colors = colors;

  final CustomColorsConverterCreator<T> converter;
  final Map<String, Color> _colors;

  @override
  ThemeExtension<CustomColors<T>> copyWith({MapEntry<String, Color>? color}) {
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
      colors: _colors.map(
        (k, v) => MapEntry(k, Color.lerp(v, other._colors[k], t)!),
      ),
      converter: converter,
    );
  }

  T call() => converter(_colors).convert();

  static T of<T extends Object>(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors<T>>();

    assert(colors != null);
    return colors!();
  }
}
