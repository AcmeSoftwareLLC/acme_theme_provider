
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class AcmeColorDecoder {

  Map<String, dynamic> decodeColor(String componentName, ColorScheme colorScheme, String componentType, Map<String, dynamic> theme){
    final surface = colorScheme.surface;
    final colorValue = surface.value.toRadixString(16);
    final hex = '#$colorValue';
    print('hex: #${colorValue}, int: ${surface.value}');
    print('the color is: $colorValue');
    final theme1 = {
      'theme_mode': 0,
      'theme_data': {},
      'dark_theme_data': {},
      'components': {
        'OneAppBar': {
          'type': 'app.bar',
          'theme': {
            'backgroundColor': hex,
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
            'backgroundColor': hex,
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
          'theme1': {
            'fillColor': '#FFFF00',
          },
        },
        'SecondTextField': {
          'type': 'text.field',
          'theme1': {
            'fillColor': '#800000',
            'filled': true,
            'labelStyle': {
              'color': '#FFFFFF',
            }
          },
        },
        'FirstCard': {
          'type': 'card',
          'theme1': {
            'color': '#FF00FF',
            'elevation': 4.0,
          },
        },
        'SecondCard': {
          'type': 'card',
          'theme1': {
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
          'theme1': {
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
          'theme1': {'thumbColor': '#000000'},
        },
        'SecondSlider': {
          'type': 'slider',
          'activeColor': '#55FF00CC',
          'inactiveColor': '#55AA00DD',
        },
        'FirstSnackBar': {
          'type': 'snack.bar',
          'theme1': {
            'backgroundColor': '#000000',
            'behavior': 'floating',
          },
          'margin': {'bottom': 16.0, 'left': 16.0, 'right': 16.0, 'top': 16.0}
        },
        'FirstChip': {
          'type': 'chip',
          'theme1': {
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
          'theme1': {
            'backgroundColor': '#FFFF00',
          }
        },
        'FirstDialog': {
          'type': 'dialog',
          'theme1': {
            'backgroundColor': '#55FF00CC',
            'shape': {'type': 'stadium'}
          },
        },
      },
    };

    final deserializer = Deserializer(theme);
    final color = deserializer('components');
    // final componentData = Deserializer(componentColors);
    // final comp = componentData.getString('AppBar');
    // print('here: ${comp.toString()}');


    final newColor = color(componentName);
    final componentTheme = newColor.getMap('theme');
    final componentColor = componentTheme.values.first;
    print(componentColor);


    final componentColors = {
      'app.bar': 'surface',
      'text_field': 'surface-variant',
      'card': 'on surface',
      'slider' : 'primary',

    };


    // final colorValue = int.parse(componentColor);




    // switch (componentType) {
    //   case 'app.bar':
    //     return colorValue;
    //   case 'card':
    //     return 'on surface';
    //   case 'slider':
    //     return 'primary';
    // }


    return theme1;



  }
}