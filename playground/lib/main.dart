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
            'elevation': 0.0,
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
