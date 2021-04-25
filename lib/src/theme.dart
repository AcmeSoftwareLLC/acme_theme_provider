import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';

class AcmeTheme {
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

  factory AcmeTheme.fallback() {
    return AcmeTheme._(
      name: 'Acme Theme',
      lightTheme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
    );
  }

  factory AcmeTheme.fromJson(String json) {
    Map<String, dynamic> themeMap;
    try {
      themeMap = Map.from(jsonDecode(json));
    } on Exception {
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
      lightTheme: _resolveTheme(themeMap['theme_data'], Brightness.light),
      darkTheme: _resolveTheme(themeMap['dark_theme_data'], Brightness.dark),
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

ThemeData _resolveTheme(
  Object rawThemeData,
  Brightness fallbackBrightness,
) {
  return ThemeDecoder.decodeThemeData(rawThemeData) ??
      ThemeData(brightness: fallbackBrightness);
}

class InvalidAcmeThemeException {
  @override
  String toString() => 'Invalid Acme Theme';
}
