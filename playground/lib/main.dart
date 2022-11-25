import 'dart:convert';

import 'package:acme_theme_provider/acme_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:playground/playground_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = {
      'theme_mode': 0,
      'theme_data': {},
      'dark_theme_data': {},
      'components': {
        'OneAppBar': {
          'type': 'app.bar',
          'theme': {
            'backgroundColor': '#55FF0000',
          },
          'divider': {
            'thickness': 4.0,
            'color': '#00FF00',
          },
        },
        'TwoAppBar': {
          'type': 'app.bar',
          'theme': {
            'backgroundColor': '#0000FF',
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
          'type': 'textField',
          'theme': {
            'fillColor': '#FFFF00',
          },
        },
        'SecondTextField': {
          'type': 'textField',
          'theme': {
            'fillColor': '#800000',
            'filled': true,
            'labelStyle': {
              'color': '#FFFFFF',
            }
          },
        },
        'FirstCard': {
          'type': 'card',
          'theme': {
            "color": '#FF00FF',
            "elevation": 4.0,
          },
        },
        'SecondCard': {
          'type': 'card',
          'theme': {
            "color": '#FFDDFF',
            "elevation": 8.0,
            "shadowColor": '#800000',
            "shape": {"type": "stadium"},
            "surfaceTintColor": '#55FF0000'
          },
        },
      },
    };

    return AcmeThemeProvider(
      source: jsonEncode(theme),
      builder: (context, theme) {
        return MaterialApp(
          title: 'Playground',
          theme: theme.lightTheme,
          darkTheme: theme.darkTheme,
          home: const PlaygroundPage(),
        );
      },
    );
  }
}
