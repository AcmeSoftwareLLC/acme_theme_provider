import 'dart:convert';

import 'package:acme_theme_provider/acme_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';

class AcmeTheme<T extends Object> {
  final String name;
  final ThemeData lightTheme;
  final ThemeData darkTheme;
  final ThemeMode themeMode;

  AcmeTheme._({
    required this.name,
    required this.lightTheme,
    required this.darkTheme,
    required this.themeMode,
  });

  factory AcmeTheme.fallback({
    CustomColorsConverterCreator<T>? customColorsConverterCreator,
  }) {
    final extensions = [
      if (customColorsConverterCreator != null)
        CustomColors<T>(
          converter: customColorsConverterCreator,
          colors: {},
        ),
    ];

    return AcmeTheme._(
      name: 'Acme Theme',
      lightTheme: ThemeData.light().copyWith(extensions: extensions),
      darkTheme: ThemeData.dark().copyWith(extensions: extensions),
      themeMode: ThemeMode.light,
    );
  }

  factory AcmeTheme.fromJson(
    String json, {
    CustomColorsConverterCreator<T>? customColorsConverterCreator,
  }) {
    Map<String, dynamic> themeMap;
    try {
      themeMap = Map.from(jsonDecode(json));
    } catch (_) {
      throw InvalidAcmeThemeException();
    }

    assert(themeMap.containsKey('theme_mode'), _keyRequired('theme_mode'));
    assert(themeMap.containsKey('theme_data'), _keyRequired('theme_data'));
    assert(
      themeMap.containsKey('dark_theme_data'),
      _keyRequired('dark_theme_data'),
    );

    return AcmeTheme._(
      name: themeMap['name'] ?? 'Acme Theme',
      lightTheme: _resolveTheme<T>(
        themeMap['theme_data'],
        Brightness.light,
        customColorsConverterCreator: customColorsConverterCreator,
      ),
      darkTheme: _resolveTheme<T>(
        themeMap['dark_theme_data'],
        Brightness.dark,
        customColorsConverterCreator: customColorsConverterCreator,
      ),
      themeMode: ThemeMode.values[themeMap['theme_mode'] ?? 1],
    );
  }

  AcmeTheme copyWith({
    ThemeData? lightTheme,
    ThemeData? darkTheme,
    ThemeMode? themeMode,
  }) {
    return AcmeTheme._(
      name: this.name,
      lightTheme: lightTheme ?? this.lightTheme,
      darkTheme: darkTheme ?? this.darkTheme,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}

String _keyRequired(String key) => '"$key" key is required in json theme.';

ThemeData _resolveTheme<T extends Object>(
  Object rawThemeData,
  Brightness fallbackBrightness, {
  CustomColorsConverterCreator<T>? customColorsConverterCreator,
}) {
  if (rawThemeData is Map) {
    final customColors = Map.from(rawThemeData['custom_colors'] ?? {});
    final extensions = [
      if (customColorsConverterCreator != null)
        CustomColors<T>(
          converter: customColorsConverterCreator,
          colors: customColors.map(
            (k, v) => MapEntry(k, ThemeDecoder.decodeColor(v)!),
          ),
        ),
    ];

    final decodedThemeData = ThemeDecoder.decodeThemeData(rawThemeData)
        ?.copyWith(extensions: extensions);

    final fallbackThemeData = ThemeData(
      brightness: fallbackBrightness,
      extensions: extensions,
    );

    return decodedThemeData ?? fallbackThemeData;
  }

  return ThemeData(
    brightness: fallbackBrightness,
    extensions: [
      if (customColorsConverterCreator != null)
        CustomColors<T>(
          converter: customColorsConverterCreator,
          colors: {},
        ),
    ],
  );
}

class InvalidAcmeThemeException {
  @override
  String toString() => 'Invalid Acme Theme';
}
