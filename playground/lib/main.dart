import 'dart:convert';

import 'package:acme_theme_provider/acme_theme_provider.dart';
import 'package:flutter/material.dart';

import 'components/one_app_bar.dart';
import 'components/two_app_bar.dart';

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
            'backgroundColor': '#FF0000',
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
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playground'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            OneAppBar(
              title: Text('One App Bar'),
              leading: Icon(Icons.menu),
            ),
            TwoAppBar(
              title: Text('Two App Bar'),
              leading: Icon(Icons.menu),
            ),
          ],
        ),
      ),
    );
  }
}
