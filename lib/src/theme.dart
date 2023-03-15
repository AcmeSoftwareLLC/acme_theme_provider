// Copyright (c) 2022. Acme Software LLC. All rights reserved.

import 'dart:convert';
import 'dart:ui' as ui;

import '../acme_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:json_theme/json_theme.dart';

/// Defines the configuration of the overall visual Theme based on the provided properties.
class AcmeThemeData<T extends Object> {
  AcmeThemeData._({
    required this.name,
    required this.lightTheme,
    required this.darkTheme,
    required this.themeMode,
    required this.components,
  });

  /// The fallback theme to use when no theme configurations are provided.
  factory AcmeThemeData.fallback({
    CustomColorsConverterCreator<T>? customColorsConverterCreator,
  }) {
    final extensions = [
      if (customColorsConverterCreator != null)
        CustomColors<T>(
          converter: customColorsConverterCreator,
          colors: {},
        ),
    ];

    final typography = Typography.material2021();

    final lightTheme = ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.red,
      ),
      useMaterial3: true,
      textTheme: typography.black,
    ).copyWith(
      extensions: extensions,
      primaryTextTheme: typography.black,
    );

    final darkTheme = ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
      textTheme: typography.white,
    ).copyWith(
      extensions: extensions,
      primaryTextTheme: typography.white,
    );

    return AcmeThemeData._(
      name: 'Acme Theme',
      lightTheme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      components: {},
    );
  }

  /// The theme created based on the provided [json].
  factory AcmeThemeData.fromJson(
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

    return AcmeThemeData._(
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
      components: Map.from(themeMap['components']).map(
        (k, v) => MapEntry(k, ComponentConfig.decode(v['type'], v)),
      ),
    );
  }

  /// The name of the theme.
  final String name;

  /// The light theme.
  final ThemeData lightTheme;

  /// The dark theme.
  final ThemeData darkTheme;

  /// The theme mode.
  final ThemeMode themeMode;

  /// The component configurations.
  final Map<String, ComponentConfig> components;

  /// Creates a copy of this theme but with the given fields replaced with the new values.
  AcmeThemeData copyWith({
    ThemeData? lightTheme,
    ThemeData? darkTheme,
    ThemeMode? themeMode,
  }) {
    return AcmeThemeData._(
      name: name,
      lightTheme: lightTheme ?? this.lightTheme,
      darkTheme: darkTheme ?? this.darkTheme,
      themeMode: themeMode ?? this.themeMode,
      components: components,
    );
  }
}

String _keyRequired(String key) => '"$key" key is required in json theme.';

ThemeData _resolveTheme<T extends Object>(
  Object rawThemeData,
  Brightness fallbackBrightness, {
  CustomColorsConverterCreator<T>? customColorsConverterCreator,
}) {
  if (rawThemeData is Map && rawThemeData.isNotEmpty) {
    final resThemeData = Map.of(rawThemeData);
    final customColors = Map.from(resThemeData['customColors'] ?? {});

    final extensions = [
      if (customColorsConverterCreator != null)
        CustomColors<T>(
          converter: customColorsConverterCreator,
          colors: customColors.map(
            (k, v) => MapEntry(k, CustomColor.fromMap(k, v)),
          ),
        ),
    ];

    resThemeData.remove('customColors');

    final decodedThemeData = ThemeDecoder.decodeThemeData(resThemeData)
        ?.copyWith(extensions: extensions);

    final fallbackThemeData = ThemeData(
      brightness: fallbackBrightness,
      extensions: extensions,
      useMaterial3: true,
    );

    final themeData = decodedThemeData ?? fallbackThemeData;
    final textTheme = themeData.textTheme;

    final fonts = GoogleFonts.asMap().map(
      (k, v) => MapEntry(k.replaceAll(' ', ''), v),
    );

    return themeData.copyWith(
      textTheme: textTheme.copyWith(
        displayLarge: _getStyle(fonts, textTheme.displayLarge),
        displayMedium: _getStyle(fonts, textTheme.displayMedium),
        displaySmall: _getStyle(fonts, textTheme.displaySmall),
        headlineLarge: _getStyle(fonts, textTheme.headlineLarge),
        headlineMedium: _getStyle(fonts, textTheme.headlineMedium),
        headlineSmall: _getStyle(fonts, textTheme.headlineSmall),
        titleLarge: _getStyle(fonts, textTheme.titleLarge),
        titleMedium: _getStyle(fonts, textTheme.titleMedium),
        titleSmall: _getStyle(fonts, textTheme.titleSmall),
        labelLarge: _getStyle(fonts, textTheme.labelLarge),
        labelMedium: _getStyle(fonts, textTheme.labelMedium),
        labelSmall: _getStyle(fonts, textTheme.labelSmall),
        bodyLarge: _getStyle(fonts, textTheme.bodyLarge),
        bodyMedium: _getStyle(fonts, textTheme.bodyMedium),
        bodySmall: _getStyle(fonts, textTheme.bodySmall),
      ),
    );
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
    useMaterial3: true,
  );
}

TextStyle? _getStyle(Map<String, TextStyleBuilder> fonts, TextStyle? style) {
  var fontFamily = style?.fontFamily ?? 'Roboto';
  if (fontFamily.contains('_')) fontFamily = fontFamily.split('_').first;

  final textStyleBuilder = fonts[fontFamily] ?? GoogleFonts.roboto;
  return style?.merge(textStyleBuilder()).copyWith(inherit: false);
}

/// The exception thrown when the provided json is not a valid [AcmeThemeData].
class InvalidAcmeThemeException implements Exception {
  @override
  String toString() => 'Invalid Acme Theme';
}

/// Signature for building a [TextStyle].
typedef TextStyleBuilder = TextStyle Function({
  TextStyle? textStyle,
  Color? color,
  Color? backgroundColor,
  double? fontSize,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  double? letterSpacing,
  double? wordSpacing,
  TextBaseline? textBaseline,
  double? height,
  Locale? locale,
  Paint? foreground,
  Paint? background,
  List<ui.Shadow>? shadows,
  List<ui.FontFeature>? fontFeatures,
  TextDecoration? decoration,
  Color? decorationColor,
  TextDecorationStyle? decorationStyle,
  double? decorationThickness,
});
