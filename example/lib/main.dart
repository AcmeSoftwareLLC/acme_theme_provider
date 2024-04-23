import 'package:acme_theme/acme_theme.dart';
import 'package:acme_theme_example/earth_colors.dart';
import 'package:acme_theme_example/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EarthApp());
}

class EarthApp extends StatelessWidget {
  const EarthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AcmeThemeScope.asset(
      path: 'assets/themes/earth.acme',
      customColorsConverterCreator: EarthColorsConverter.new,
      builder: (context, theme) {
        return MaterialApp(
          theme: theme.lightTheme,
          darkTheme: theme.darkTheme,
          themeMode: theme.themeMode,
          home: const HomePage(),
        );
      },
    );
  }
}
