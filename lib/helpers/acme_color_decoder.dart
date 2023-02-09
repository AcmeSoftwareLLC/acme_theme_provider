import 'package:flutter/material.dart';

class AcmeColorDecoder {

  Map<String, dynamic> cleanupColors(Map<String, dynamic> map,
      ColorScheme colorScheme, {required List<String> keys,}) {

    final componentTheme = Map.of(map);
    for (final key in keys) {
      String colorValue;
      if (key.contains('.')) {
        final subKeys = key.split('.');
        colorValue = '${componentTheme[subKeys[0]][subKeys[1]][subKeys[2]][subKeys[3]]}';
        if (!colorValue.startsWith('#')) {
          componentTheme[key] = _getComponentColor(colorValue, colorScheme);
        }
      }
      else {
        colorValue = '${componentTheme['components']['OneAppBar']['theme'][key]}';
        String resultItem = componentTheme['components']['OneAppBar']['theme'][key];
        resultItem = _getComponentColor(colorValue, colorScheme).toString();
        componentTheme['components']['OneAppBar']['theme'][key] = resultItem;
      }
    }
    return componentTheme;
  }

  Color _getComponentColor(String componentColor, ColorScheme colorScheme) {
    switch (componentColor) {
      case 'surface':
        return colorScheme.surface;
      case 'on-surface':
        return colorScheme.onSurface;
      case 'surface-variant':
        return colorScheme.surfaceVariant;
    }
    return colorScheme.primary;
  }
}
