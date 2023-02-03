import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class AcmeColorDecoder {
  Map<String, dynamic> decodeColor(String componentType,
      ColorScheme colorScheme, Map<String, dynamic> theme) {
    final deserializer = Deserializer(theme);
    final color = deserializer('components');
    final newColor = color(componentType);
    final componentTheme = newColor.getMap('theme');
    final componentColor = componentTheme.values.first;
    final compColor = _getComponentColor(componentColor, colorScheme);
    final colorValue = compColor.value.toRadixString(16);
    final hexValue = '#$colorValue';
    final modifiedTheme = {
      'theme_mode': 0,
      'theme_data': {},
      'dark_theme_data': {},
      'components': {
        'OneAppBar': {
          'type': 'app.bar',
          'theme': {
            'backgroundColor': hexValue,
            'toolbarHeight': 300,
          },
          'divider': {
            'thickness': 4.0,
            'color': '#FFAAAAAA',
          },
        },
        'TwoAppBar': {
          'type': 'app.bar',
          'theme': {
            'backgroundColor': hexValue,
            'foregroundColor': '#FFFFFF',
          },
        },
        'AcmeOutlinedButton': {
          'type': 'button',
          'style': {
            'elevation': 2.0,
            'backgroundColor': '#000000',
          },
          'buttonType': 'outlined'
        },
        'AcmeTextButton': {
          'type': 'button',
          'buttonType': 'text',
        },
        'AcmeElevatedButton': {
          'type': 'button',
          'style': {
            'elevation': 2.0,
            'backgroundColor': '#FFFF00',
          },
          'buttonType': 'elevated',
        },
        'FirstTextField': {
          'type': 'text.field',
          'modifiedTheme': {
            'fillColor': '#FFFF00',
          },
        },
        'SecondTextField': {
          'type': 'text.field',
          'modifiedTheme': {
            'fillColor': '#800000',
            'filled': true,
            'labelStyle': {
              'color': '#FFFFFF',
            }
          },
        },
        'FirstCard': {
          'type': 'card',
          'modifiedTheme': {
            'color': '#FF00FF',
            'elevation': 4.0,
          },
        },
        'SecondCard': {
          'type': 'card',
          'modifiedTheme': {
            'color': '#FFDDFF',
            'elevation': 8.0,
            'shadowColor': '#800000',
            'shape': {'type': 'stadium'},
            'surfaceTintColor': '#55FF0000'
          },
        },
        'FirstDropdownButton': {
          'type': 'dropdown.button',
        },
        'SecondDropdownButton': {
          'type': 'dropdown.button',
          'isExpanded': true,
          'borderRadius': {
            'radius': 8.0,
            'type': 'circular',
          },
          'dropdownColor': '#FFFF00AA',
          'focusColor': '#55FF00BB',
          'iconDisabledColor': '#55FF00CC',
          'iconEnabledColor': '#55AA00DD',
        },
        'FirstSwitch': {
          'type': 'switch',
          'modifiedTheme': {
            'overlayColor': '#FFFFFFAA',
            'splashRadius': 20.0,
            'thumbColor': '#FFFFFF',
            'trackColor': '#55AA00DD'
          }
        },
        'SecondSwitch': {
          'type': 'switch',
          'focusColor': '#FFFF00AA',
          'activeColor': '#551100BB',
          'activeTrackColor': '#55BB00BB',
          'hoverColor': '#55CC00BB',
          'inactiveThumbColor': '#DD00FF',
          'inactiveTrackColor': '#EEFFBB',
        },
        'FirstSlider': {
          'type': 'slider',
          'modifiedTheme': {'thumbColor': '#000000'},
        },
        'SecondSlider': {
          'type': 'slider',
          'activeColor': '#55FF00CC',
          'inactiveColor': '#55AA00DD',
        },
        'FirstSnackBar': {
          'type': 'snack.bar',
          'modifiedTheme': {
            'backgroundColor': '#000000',
            'behavior': 'floating',
          },
          'margin': {'bottom': 16.0, 'left': 16.0, 'right': 16.0, 'top': 16.0}
        },
        'FirstChip': {
          'type': 'chip',
          'modifiedTheme': {
            'disabledColor': '#FF0000',
            'secondarySelectedColor': '#FF0000',
            'selectedColor': '#AABBCC',
            'labelStyle': {'fontSize': 36.0},
            'secondaryLabelStyle': {'fontSize': 36.0},
            'padding': {
              'bottom': 16.0,
              'left': 16.0,
              'right': 16.0,
              'top': 16.0
            }
          },
        },
        'SecondChip': {
          'type': 'chip',
          'surfaceTintColor': '#55FF00CC',
        },
        'FirstAlertDialog': {
          'type': 'alert.dialog',
          'modifiedTheme': {
            'backgroundColor': '#FFFF00',
          }
        },
        'FirstDialog': {
          'type': 'dialog',
          'modifiedTheme': {
            'backgroundColor': '#55FF00CC',
            'shape': {'type': 'stadium'}
          },
        },
      },
    };
    return modifiedTheme;
  }
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
