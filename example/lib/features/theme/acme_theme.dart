import 'package:acme_theme_provider/acme_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';

@immutable
class AcmeTheme {
  const AcmeTheme({
    required this.name,
    required this.themeData,
    required this.darkThemeData,
    this.themeMode = ThemeMode.light,
  });

  factory AcmeTheme.fromJson(Map<String, dynamic> json) {
    final rawThemeData = json['theme_data'];
    final rawDarkThemeData = json['dark_theme_data'];
    final themeMode = json['theme_mode'];
    final decodedLightTheme = ThemeDecoder.decodeThemeData(rawThemeData);
    final decodedDarkTheme = ThemeDecoder.decodeThemeData(rawDarkThemeData);


    return AcmeTheme(
      name: json['name'] ?? '',
      themeData: (decodedLightTheme ?? ThemeData.light()).copyWith(
      ),
      darkThemeData: (decodedDarkTheme ?? ThemeData.dark()).copyWith(
      ),
      themeMode: themeMode ?? ThemeMode.light,
    );
  }

  final ThemeData themeData;
  final ThemeData darkThemeData;
  final ThemeMode themeMode;
  final String name;

  AcmeTheme apply(
    ThemeData data,) {
    final isDark = themeMode == ThemeMode.dark;
    return copyWith(
      themeMode: themeMode,
      themeData: isDark ? null : data,
      darkThemeData: isDark ? data : null,
    );
  }

  AcmeTheme copyWith({
    ThemeData? themeData,
    ThemeData? darkThemeData,
    ThemeMode? themeMode,
    Map<String, CustomColor>? customColors,
  }) {
    final extensions = customColors == null
        ? null
        : [
            CustomColors(
              converter: MapCustomColorConverter.new,
              colors: customColors,
            ),
          ];

    final isDark = themeMode == ThemeMode.dark;

    return AcmeTheme(
      themeData: (themeData ?? this.themeData).copyWith(
        extensions: isDark ? null : extensions,
      ),
      darkThemeData: (darkThemeData ?? this.darkThemeData).copyWith(
        extensions: isDark ? extensions : null,
      ),
      themeMode: themeMode ?? this.themeMode,
      name: name,
    );
  }

  Map<String, dynamic> toJson() {
    final customColors =
        themeData.extension<CustomColors<Map<String, CustomColor>>>();
    final darkCustomColors =
        darkThemeData.extension<CustomColors<Map<String, CustomColor>>>();

    final rawThemeData = ThemeEncoder.encodeThemeData(themeData);
    if (customColors != null) {
      rawThemeData?['customColors'] = customColors.colors.map(
        (k, v) => MapEntry(k, v.toMap()),
      );
    }

    final rawDarkThemeData = ThemeEncoder.encodeThemeData(darkThemeData);
    if (darkCustomColors != null) {
      rawDarkThemeData?['customColors'] = darkCustomColors.colors.map(
        (k, v) => MapEntry(k, v.toMap()),
      );
    }

    return {
      'name': name,
      'theme_data': rawThemeData,
      'dark_theme_data': rawDarkThemeData,
      'theme_mode': themeMode.index,
    };
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is AcmeTheme &&
            runtimeType == other.runtimeType &&
            themeData == other.themeData &&
            darkThemeData == other.darkThemeData &&
            themeMode == other.themeMode &&
            name == other.name;
  }

  @override
  int get hashCode {
    return themeData.hashCode ^
        darkThemeData.hashCode ^
        themeMode.hashCode ^
        name.hashCode;
  }
}
